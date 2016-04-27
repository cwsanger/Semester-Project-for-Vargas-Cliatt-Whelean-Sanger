class LeadsController < ApplicationController
  before_action :set_temp_user, only: [:accept, :deny]
  before_action :set_business, only: [:accept_business, :deny_business]
  before_action :set_agency, only: [:accept_agency, :deny_agency]

  before_action :set_neighborhood

  def accept
    user = User.create(name: @temp_user.name, neighborhood_id: @neighborhood.id, image_url: open('app/assets/images/placeholder.png'))
    user.build_account(email: @temp_user.email,
                       password: 'password',
                       password_confirmation: 'password')

    respond_to do |format|
      if user.save
        @temp_user.destroy
        @temp_users = @neighborhood.temp_users

        format.html { redirect_to neighborhood_admin_url(@neighborhood) }
        format.js { render action: 'rerender_temp_users' }
      else
        @temp_users = @neighborhood.temp_users
        format.html { redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed' }
        format.js { render action: 'rerender_temp_users' }
      end
    end
  end

  def deny
    @temp_user.destroy
    @temp_users = @neighborhood.temp_users

    respond_to do |format|
      format.html { redirect_to neighborhood_admin_url(@neighborhood) }
      format.js { render action: 'rerender_temp_users' }
    end
  end

  def accept_business
    @neighborhood.businesses << @business

    respond_to do |format|
      if @neighborhood.save
        Request.where(neighborhood_id: @neighborhood.id,
                      requestable: @business).destroy_all

        format.html { redirect_to neighborhood_admin_url(@neighborhood) }
      else
        format.html { redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed' }
      end

      @businesses = Business.joins('INNER JOIN requests ON businesses.id = requests.requestable_id')
                            .where("requests.neighborhood_id = #{@neighborhood.id}")

      format.js { render action: 'rerender_businesses' }
    end
  end

  def deny_business
    Request.where(neighborhood_id: @neighborhood.id,
                  requestable: @business).destroy_all

    respond_to do |format|
      format.html { redirect_to neighborhood_admin_url(@neighborhood) }
      @businesses = Business.joins('INNER JOIN requests ON businesses.id = requests.requestable_id')
                            .where("requests.neighborhood_id = #{@neighborhood.id}")

      format.js { render action: 'rerender_businesses' }
    end
  end

  def accept_agency
    @neighborhood.agencies << @agency

    respond_to do |format|
      if @neighborhood.save
        Request.where(neighborhood_id: @neighborhood.id,
                      requestable: @agency).destroy_all

        format.html { redirect_to neighborhood_admin_url(@neighborhood) }
      else
        format.html { redirect_to neighborhood_admin_url(@neighborhood), alert: 'failed' }
      end

      @agencies= Agency.joins('INNER JOIN requests ON agencies.id = requests.requestable_id')
                            .where("requests.neighborhood_id = #{@neighborhood.id}")

      format.js { render action: 'rerender_agencies' }
    end
  end

  def deny_agency
    Request.where(neighborhood_id: @neighborhood.id,
                  requestable: @agency).destroy_all

    @agencies= Agency.joins('INNER JOIN requests ON agencies.id = requests.requestable_id')
                          .where("requests.neighborhood_id = #{@neighborhood.id}")

    respond_to do |format|
      format.html { redirect_to neighborhood_admin_url(@neighborhood) }
      format.js { render action: 'rerender_agencies' }
    end
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
