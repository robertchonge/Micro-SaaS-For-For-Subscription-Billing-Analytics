ApplicationController
  skip_before_action :verify_authenticity_token

  def stripe
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, ENV['STRIPE_WEBHOOK_SECRET']
      )
    rescue JSON::ParserError => e
      render json: { message: 'Invalid payload' }, status: 400 and return
    rescue Stripe::SignatureVerificationError => e
      render json: { message: 'Invalid signature' }, status: 400 and return
    end

    case event.type
    when 'invoice.paid'
      invoice_data = event.data.object
      handle_invoice_paid(invoice_data)
    end

    render json: { message: 'Success' }, status: 200
  end

  private

  def handle_invoice_paid(data)
    subscription_id = data.subscription
    subscription = Subscription.find_by(stripe_subscription_id: subscription_id)
    return unless subscription

    client = subscription.user.clients.first
    Invoice.create!(
      client: client,
      subscription: subscription,
      amount_cents: data.amount_paid,
      status: 'paid',
      due_date: Time.at(data.due_date)
    )
  end
end
