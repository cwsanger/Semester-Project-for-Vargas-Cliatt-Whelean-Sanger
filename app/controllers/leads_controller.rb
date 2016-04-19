class LeadsController < ApplicationController
  before_action :set_temp_user, only: [:accept, :deny]
  before_action :set_business, only: [:accept_business, :deny_business]
  before_action :set_agency, only: [:accept_agency, :deny_agency]

  before_action :set_neighborhood

  def accept
    user = User.create(name: @temp_user.name, neighborhood_id: @neighborhood.id)
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

    redirect_to neighborhood_admin_url(@neighborhood)
  end

  def accept_business
    @neighborhood.businesses << @business

    if @neighborhood.save
      Request.where(neighborhood_id: @neighborhood.id,
                    requestable: @business).destroy_all

      redirect_to neighborhood_admin_url(@neighborhood)
    else
      redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed'
    end
  end

  def deny_business
    Request.where(neighborhood_id: @neighborhood.id,
                  requestable: @business)

    redirect_to neighborhood_admin_url(@neighborhood)
  end

  def accept_agency
    @neighborhood.agencies << @agency

    if @neighborhood.save
      Request.where(neighborhood_id: @neighborhood.id,
                    requestable: @agency).destroy_all

      redirect_to neighborhood_admin_url(@neighborhood)
    else
      redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed'
    end
  end

  def deny_business
    Request.where(neighborhood_id: @neighborhood.id,
                  requestable: @agency).destroy_all

    redirect_to neighborhood_admin_url(@neighborhood)
  end

  private
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end

    def set_business
      @business = Business.find(params[:id])
    end

    def set_agency
      @agency = Agency.find(params[:id])
    end

    def set_neighborhood
      @neighborhood = Neighborhood.find_by_slug(params[:neighborhood_id])
    end
end
