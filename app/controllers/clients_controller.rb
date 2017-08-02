class ClientsController < ApplicationController
  before_action :find_client, only: %i(show edit update destroy)
  def index
    @clients = Client.order(:id).page(params[:page])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:created] = t('messages.clients.successful.created')
      redirect_to @client
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      flash[:updated] = t('messages.clients.successful.updated')
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    flash[:destroyed] = t('messages.clients.successful.destroyed')
    redirect_to clients_path
  end

  private

  def find_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name)
  end
end
