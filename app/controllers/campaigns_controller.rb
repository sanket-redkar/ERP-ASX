class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :available_dates, :assign_site]

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit
  end

  # GET /campaigns/:id/available_dates
  # GET /campaigns/:id/available_dates.json
  # GET /campaigns/:id/available_dates.js
  def available_dates
    respond_to do |format|
      if params[:campaign_reporting].present? && params[:campaign_reporting].kind_of?(ActionController::Parameters)
        if params[:campaign_reporting].keys.include?('ooh_site_id')
          @campaign_reporting = @campaign.fetch_available_dates(params[:campaign_reporting])
          format.js
          format.json { render json: @campaign_reporting }
        else
          format.json{ render json: { error: 'starts_on ends_on and ooh_site_id keys data are missing'} }
        end
      else
        format.json{ render json: { error: 'campaign_reporting key data missing'}, status: 400 }
      end
    end
  end

  def assign_site
    @campaign.assign_site(params[:ooh_site_id])
    respond_to do |format|
      format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
    end
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    owner = Owner.first
    @campaign = owner.campaigns.build(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:name, :image, :starts_on, :ends_on, :client_id)
    end
end
