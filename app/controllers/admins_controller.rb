class AdminsController < ApplicationController
  before_action :set_temp_user, only: [:accept, :deny]

  def index
    @temp_users = TempUser.where(hood_type: 'TempNeighborhood')
  end

  def accept
    hood = @temp_user.hood
    neighborhood = Neighborhood.create(name: hood.name, address: hood.address)
    user = User.create(name: @temp_user.name, neighborhood_id: neighborhood.id)
    user.build_account(email: @temp_user.email,
                       password: 'password',
                       password_confirmation: 'password')

    if user.save
      @temp_user.hood.destroy
      @temp_user.destroy

      redirect_to admins_url
    else
      redirect_to admins_url, alert: 'failed to create user'
    end
  end

  def deny
    @temp_user.hood.destroy
    @temp_user.destroy

    redirect_to admins_url
  end

  private
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end
end
