class AgenciesController < ApplicationController
  include UpdateHelper
  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    auth @agency

    @alerts = @agency.alerts
    @alert = Alert.new
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)

    respond_to do |format|
      if @agency.save
        format.html { redirect_to @agency, notice: 'Agency was successfully created.' }
        format.json { render :show, status: :created, location: @agency }
      else
        format.html { render :new }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update

    update_account(@current_member, params[:updateParam], params)

  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.destroy
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: 'Agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def neighborhoods
    @agency = Agency.find(params[:agency_id])

    @neighborhoods = Neighborhood.within(20, origin: @agency)

    @requested_neighborhoods = Neighborhood.joins(:requests)
                                           .where("requests.requestable_id = #{@agency.id}")

    @hash = Gmaps4rails.build_markers(@neighborhoods) do |neighborhood, marker|
      marker.lat neighborhood.latitude
      marker.lng neighborhood.longitude
      marker.title neighborhood.name
    end
  end

  def join_request
    @agency = Agency.find(params[:agency_id])
    r = Request.create(requestable: @agency,
                       neighborhood_id: params[:neighborhood_id])

    @neighborhoods = Neighborhood.within(20, origin: @agency)

    @requested_neighborhoods = Neighborhood.joins(:requests)
                                           .where("requests.requestable_id = #{@agency.id}")

    respond_to do |format|
      if r.save
        format.html { redirect_to agency_neighborhoods_url(@agency) }
        format.js
      else
        format.html { redirect_to agency_neighborhoods_url(@agency), alert: 'Failed to create request' }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:name, :email, :image_url, :password, :password_confirmation)
    end
end
