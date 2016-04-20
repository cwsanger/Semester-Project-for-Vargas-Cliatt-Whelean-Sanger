class LeadsController < ApplicationController
  before_action :set_temp_user
  before_action :set_neighborhood

  def accept
    user = User.create(name: @temp_user.name, neighborhood_id: @neighborhood.id, image_url: open('app/assets/images/placeholder.png'))
    user.build_account(email: @temp_user.email,
                       password: 'password',
                       password_confirmation: 'password')

    if user.save
      @temp_user.destroy

      redirect_to neighborhood_admin_url(@neighborhood)
    else
      redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed'
    end
  end

  def deny
    @temp_user.destroy

    redirect_to neighborhoods_admin_url(@neighborhood)
  end

  private
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end

    def set_neighborhood
      @neighborhood = Neighborhood.find_by_slug(params[:neighborhood_id])
    end
end
