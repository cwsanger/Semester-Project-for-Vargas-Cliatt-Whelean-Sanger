class SignupsController < ApplicationController
  def register
    @temp_user = TempUser.new
    #@neighborhood = TempNeighborhood.new
  end

  def temps
    @temp_users = TempUser.all
  end

  def create
    if temp_user_params
      @user = TempUser.new(temp_user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to temps_path, notice: 'You should be approved soon' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def temp_user_params
      params.require(:temp_user).permit(:name, :email)
    end
end
