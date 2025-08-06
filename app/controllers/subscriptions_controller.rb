class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.subscriptions
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      redirect_to subscriptions_path, notice: 'Subscription created.'
    else
      render :new
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to subscriptions_path, notice: 'Subscription deleted.'
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_name, :price_cents, :interval)
  end
end
