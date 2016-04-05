class AdminsController < ApplicationController
  def approve
    @temp_users = TempUser.all
    @temp_neighborhoods = TempNeighborhood.all
  end
end
