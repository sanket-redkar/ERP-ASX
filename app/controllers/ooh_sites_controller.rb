class OohSitesController < ApplicationController
  before_action :set_ooh_site, only: [:show, :edit, :update, :destroy]

  # GET /ooh_sites
  # GET /ooh_sites.json
  def index
    @ooh_sites = OohSite.all
  end

  # GET /ooh_sites/1
  # GET /ooh_sites/1.json
  def show
  end

  # GET /ooh_sites/new
  def new
    @ooh_site = OohSite.new
  end

  # GET /ooh_sites/1/edit
  def edit
  end

  # POST /ooh_sites
  # POST /ooh_sites.json
  def create

    owner = Owner.first
    @ooh_site = owner.ooh_sites.build(ooh_site_params)

    respond_to do |format|
      if @ooh_site.save
        format.html { redirect_to @ooh_site.becomes(OohSite), notice: 'Ooh site was successfully created.' }
        format.json { render :show, status: :created, location: @ooh_site }
      else
        format.html { render :new }
        format.json { render json: @ooh_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ooh_sites/1
  # PATCH/PUT /ooh_sites/1.json
  def update
    respond_to do |format|
      if @ooh_site.update(ooh_site_params)
        format.html { redirect_to @ooh_site.becomes(OohSite), notice: 'Ooh site was successfully updated.' }
        format.json { render :show, status: :ok, location: @ooh_site }
      else
        format.html { render :edit }
        format.json { render json: @ooh_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ooh_sites/1
  # DELETE /ooh_sites/1.json
  def destroy
    @ooh_site.destroy
    respond_to do |format|
      format.html { redirect_to ooh_sites_url, notice: 'Ooh site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ooh_site
      @ooh_site = OohSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ooh_site_params
      params.require(:ooh_site).permit(:type, :name, :authority, :code, :address, :locality, :city, :latitude, :longitude, :image )
    end
end

