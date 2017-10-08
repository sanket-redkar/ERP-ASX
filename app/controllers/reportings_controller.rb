class ReportingsController < ApplicationController
  before_action :set_reporting, only: [:show, :edit, :update, :destroy]

  # GET /reportings
  # GET /reportings.json
  def index
    params[:search] ||= {}
    @reportings = Reporting.search_by(params[:search] || {} )
  end

  # GET /reportings/1
  # GET /reportings/1.json
  def show
  end

  # GET /reportings/new
  def new
    @reporting = Reporting.new
  end

  # GET /reportings/1/edit
  def edit
  end

  # POST /reportings
  # POST /reportings.json
  def create
    @reporting = Reporting.new(reporting_params)

    respond_to do |format|
      if @reporting.save
        format.html { redirect_to @reporting.becomes(Reporting), notice: 'Reporting was successfully created.' }
        format.json { render :show, status: :created, location: @reporting }
      else
        format.html { render :new }
        format.json { render json: @reporting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportings/1
  # PATCH/PUT /reportings/1.json
  def update
    respond_to do |format|
      if @reporting.update(reporting_params)
        format.html { redirect_to @reporting.becomes(Reporting), notice: 'Reporting was successfully updated.' }
        format.json { render :show, status: :ok, location: @reporting }
      else
        format.html { render :edit }
        format.json { render json: @reporting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportings/1
  # DELETE /reportings/1.json
  def destroy
    @reporting.destroy
    respond_to do |format|
      format.html { redirect_to reportings_url, notice: 'Reporting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_reporting
      @reporting = Reporting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reporting_params
      params.require(:reporting).permit(:type, :date, :campaign_id, :ooh_site_id)
    end
end
