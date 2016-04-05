class AdminsController < ApplicationController
  def index
    @temp_users = TempUser.all
    @temp_neighborhoods = TempNeighborhood.all
  end

  def accept
    #if params[:is_user]
      @registrant = TempUser.find(params[:temp_id])
      @user = User.create(:name => @registrant.name, :neighborhood_id => 2)
    #else
    # @registrant = TempNeighborhood.find(params[:temp_id])
    # @neighborhood = Neighborhood.create(:name => @registrant.name, :address => @registration.address)
    #end

    @registrant.destroy
  end
end
