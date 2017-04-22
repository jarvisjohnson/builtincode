class ClientsController < ApplicationController
  before_action :set_client, only: [:index_invoices]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_client!
  before_action :authenticate_admin, only: [:index]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # redirect_to root_url
    @client = Client.find(params[:id])
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index_invoices
    if @client.stripe_account_id?
      # @invoices = Stripe::Invoice.list(:customer => @client.stripe_account_id, limit: 12)
      # @upcoming = Stripe::Invoice.upcoming(:customer => @client.stripe_account_id)
    else
      redirect_to root_path, :notice => "You have not subscribed to a hosting plan yet; please do so below"
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:avatar, :business_name, websites_attributes: [:id, :name, :ssl, :cdn, :_destroy])
    end

    def authenticate_admin
      unless current_client.try(:admin)
        # redirect_to root_url
        redirect_to root_path
      end
    end   

end
