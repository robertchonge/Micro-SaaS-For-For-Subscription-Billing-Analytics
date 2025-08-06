class InvoicesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:client_id]
      @client = current_user.clients.find(params[:client_id])
      @invoices = @client.invoices
    else
      @invoices = Invoice.joins(:client).where(clients: { user_id: current_user.id })
    end
  end

  def show
    @invoice = Invoice.joins(:client).where(clients: { user_id: current_user.id }).find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice_#{@invoice.id}", template: 'invoices/show.html.erb'
      end
    end
  end
end
