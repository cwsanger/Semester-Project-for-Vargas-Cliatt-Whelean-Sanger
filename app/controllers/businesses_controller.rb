class BusinessesController < ApplicationController
  include UpdateHelper
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
    auth @business
    @advertisements = @business.advertisements
    @advertisement = Advertisement.new

    @neighborhood_likes = {}
    @business.neighborhoods.each do |neighborhood|
      @neighborhood_likes[neighborhood.name] =
        Like.find_by_sql(
          "SELECT * FROM likes, advertisements, users, neighborhoods, businesses WHERE likes.likeable_id = advertisements.id AND likes.likeable_type = 'Advertisement' AND likes.user_id = users.id AND users.neighborhood_id = #{neighborhood.id} AND advertisements.business_id = #{@business.id}").count / 10
    end
  end

  def display_stats
    @business = Business.find(params[:business_id])
    @advertisements = @business.advertisements

    @advertisement = Advertisement.find(params[:id])

    @neighborhood_likes = {}
    @business.neighborhoods.each do |neighborhood|
      @neighborhood_likes[neighborhood.name] =
        Like.find_by_sql(
          "SELECT * FROM likes, advertisements, users, neighborhoods, businesses WHERE likes.likeable_id = advertisements.id AND likes.likeable_type = 'Advertisement' AND advertisements.id = #{@advertisement.id} AND likes.user_id = users.id AND users.neighborhood_id = #{neighborhood.id} AND advertisements.business_id = #{@business.id}").count / 10
    end

    respond_to do |format|
      format.js
    end
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update

    update_account(@current_member, params[:updateParam], params)

  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def neighborhoods
    @business = Business.find(params[:business_id])

    @neighborhoods = Neighborhood.within(20, origin: @business)

    @requested_neighborhoods = Neighborhood.joins(:requests)
                                           .where("requests.requestable_id = #{@business.id}")

    @hash = Gmaps4rails.build_markers(@neighborhoods) do |neighborhood, marker|
      marker.lat neighborhood.latitude
      marker.lng neighborhood.longitude
      marker.title neighborhood.name
    end
  end

  def join_request
    @business = Business.find(params[:business_id])
    r = Request.create(requestable: @business,
                       neighborhood_id: params[:neighborhood_id])

    @neighborhoods = Neighborhood.within(20, origin: @business)

    @requested_neighborhoods = Neighborhood.joins(:requests)
                                           .where("requests.requestable_id = #{@business.id}")

    respond_to do |format|
      if r.save
        format.html { redirect_to business_neighborhoods_url(@business) }
        format.js
      else
        format.html { redirect_to business_neighborhoods_url(@business), alert: 'Failed to create request' }
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:name, :email, :image_url, :password, :password_confirmation)
    end

    def request_params
      params.permit(:business_id, :neighborhood_id)
    end
end
