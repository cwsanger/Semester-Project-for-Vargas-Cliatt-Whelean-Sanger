class SignupsController < ApplicationController
  skip_before_action :authenticate

  before_action :initialize_temps, only: [:register, :register_user]
  before_action :set_neighborhood, only: [:join, :register_user]

  def initialize_temps
    @temp_user = TempUser.new
    @temp_neighborhood = TempNeighborhood.new
  end

  def register
  end

  def register_user
  end

  def temps
    @temp_users = TempUser.all
    @temp_neighborhoods = TempNeighborhood.all
  end

  def create
    @temp_neighborhood = TempNeighborhood.new(temp_neighborhood_params)
    @temp_neighborhood.temp_users.build(temp_user_params)

    respond_to do |format|
      if @temp_neighborhood.save
        format.html { redirect_to temps_path, notice: 'You should be approved soon' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :register }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    @neighborhood.temp_users.build(temp_user_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to temps_path, notice: 'You should be approved soon' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :register_user }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def temp_user_params
      params.require(:temp_user).permit(:name, :email)
    end

    def temp_neighborhood_params
      params.require(:temp_neighborhood).permit(:name, :address)
    end

    def set_neighborhood
      puts params[:id]
      @neighborhood = Neighborhood.find_by_slug(params[:id])
    end
end
