class SignupsController < ApplicationController
  before_action :initialize_temps

  def initialize_temps
    @temp_user = TempUser.new
    @temp_neighborhood = TempNeighborhood.new
  end

  def register
  end

  def temps
    @temp_users = TempUser.all
    @temp_neighborhoods = TempNeighborhood.all
  end

  def create

    if making_user
      @registrant = TempUser.new(temp_user_params)
    else
      @registrant = TempNeighborhood.new(temp_neighborhood_params)
    end

    respond_to do |format|
      if @registrant.save
        format.html { redirect_to temps_path, notice: 'You should be approved soon' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :register }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  def making_user
    return params[:temp_user]
  end

  private
    def temp_user_params
      params.require(:temp_user).permit(:name, :email)
    end

    def temp_neighborhood_params
      params.require(:temp_neighborhood).permit(:name, :address)
    end
end
