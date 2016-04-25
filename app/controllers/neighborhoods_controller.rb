class NeighborhoodsController < ApplicationController
  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.all
  end

  # GET /neighborhoods/neighborhood-slug
  # GET /neighborhoods/neighborhood-slug.json
  def show
    auth @neighborhood

    @posts = Post.joins(:user)
                 .where(users: { neighborhood_id: @neighborhood.id })
                 .order(created_at: :desc)

    @alerts = @neighborhood.alerts
    @broadcasts = @neighborhood.broadcasts
    @advertisements = @neighborhood.advertisements
    @categories = Category.all
    @post = Post.new
  end

  def admin
    @neighborhood = Neighborhood.find_by_slug(params[:neighborhood_id])
    auth @neighborhood


    @temp_users = @neighborhood.temp_users
    @businesses = Business.joins('INNER JOIN requests ON businesses.id = requests.requestable_id')
                          .where("requests.neighborhood_id = #{@neighborhood.id}")

    @agencies= Agency.joins('INNER JOIN requests ON agencies.id = requests.requestable_id')
                          .where("requests.neighborhood_id = #{@neighborhood.id}")

    @broadcast = Broadcast.new
    @broadcasts = @neighborhood.broadcasts

    @posts = Post.where(status: Post.statuses[:flag])
    @comments = Comment.where(status: Comment.statuses[:flag])
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/neighborhood-slug/edit
  def edit
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    @neighborhood = Neighborhood.new(neighborhood_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully created.' }
        format.json { render :show, status: :created, location: @neighborhood }
      else
        format.html { render :new }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighborhoods/neighborhood-slug
  # PATCH/PUT /neighborhoods/neighborhood-slug.json
  def update
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to @neighborhood, notice: 'Neighborhood was successfully updated.' }
        format.json { render :show, status: :ok, location: @neighborhood }
      else
        format.html { render :edit }
        format.json { render json: @neighborhood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/neighborhood-slug
  # DELETE /neighborhoods/neighborhood-slug.json
  def destroy
    @neighborhood.destroy
    respond_to do |format|
      format.html { redirect_to neighborhoods_url, notice: 'Neighborhood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighborhood
      @neighborhood = Neighborhood.find_by_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params.require(:neighborhood).permit(:name)
    end
end
