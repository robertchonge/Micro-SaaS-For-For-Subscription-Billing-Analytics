class StripeCheckoutService
  def initialize(user, plan)
    @user = user
    @plan = plan
  end

  def create_session
    Stripe::Checkout::Session.create({
      customer_email: @user.email,
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: { name: @plan.plan_name },
          unit_amount: @plan.price_cents,
          recurring: { interval: @plan.interval }
        },
        quantity: 1
      }],
      mode: 'subscription',
      success_url: Rails.application.routes.url_helpers.dashboard_url,
      cancel_url: Rails.application.routes.url_helpers.root_url
    })
  end
end
