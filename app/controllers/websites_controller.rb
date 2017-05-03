class WebsitesController < ApplicationController
  
  before_filter :load_client
  before_action :authenticate_client!
  before_action :set_website, only: [:show, :edit, :update, :destroy]
  # before_action :set_client

  # GET /websites
  # GET /websites.json
  def index
    @websites = Website.where(client_id: current_client.uuid) 
  end

  # GET /websites/1
  # GET /websites/1.json
  def show
  end

  # GET /websites/new
  def new
    @website = websites.new
    @website.features.build
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites
  # POST /websites.jsonclient_website_path
  def create
    @website = websites.new(website_params)

    respond_to do |format|
      if @website.save
        flash[:notice] = :success
        format.html { redirect_to @website, notice: 'Website was successfully created.' }
        format.json { render :show, status: :created, location: @website }
      else
        format.html { render :new }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1
  # PATCH/PUT /websites/1.json
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to @website, notice: 'Website was successfully updated.' }
        format.json { render :show, status: :ok, location: @website }
      else
        format.html { render :edit }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.json
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url, notice: 'Website was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = Website.friendly.find(params[:id])
    end

    def load_client
      params[:client_id] ? @client = Client.friendly.find(params[:client_id]) : @client = current_client
    end

    def websites
      params[:client_id] ? @client.websites : Website
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
      params.require(:website).permit(:client_id, :features_id, :billing_units, :name, :app_type, :ssl, :cdn, :monthly_cost_cents)
    end
    
end
