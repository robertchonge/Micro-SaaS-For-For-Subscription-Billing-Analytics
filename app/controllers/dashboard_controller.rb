class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = current_user.subscriptions
    @clients = current_user.clients
    @revenue = Invoice.where(status: 'paid', client: @clients).sum(:amount_cents) / 100.0
    @monthly_revenue = Invoice.where(status: 'paid', client: @clients).group_by_month(:created_at).sum(:amount_cents)
  end
end
