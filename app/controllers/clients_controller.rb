class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = current_user.clients
  end

  def show
    @client = current_user.clients.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.build(client_params)
    if @client.save
      redirect_to clients_path, notice: 'Client added.'
    else
      render :new
    end
  end

  def edit
    @client = current_user.clients.find(params[:id])
  end

  def update
    @client = current_user.clients.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path, notice: 'Client updated.'
    else
      render :edit
    end
  end

  def destroy
    @client = current_user.clients.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: 'Client removed.'
  end

  private

  def client_params
    params.require(:client).permit(:name, :email)
  end
end
