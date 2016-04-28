class AdminsController < ApplicationController
  include UpdateHelper

  before_action :set_temp_user, only: [:accept_user, :deny_user]
  before_action :set_temp_business, only: [:accept_business, :deny_business]
  before_action :set_temp_agency, only: [:accept_agency, :deny_agency]

  def index
    auth Admin

    @temp_users = TempUser.where(hood_type: 'TempNeighborhood')
    @temp_businesses = TempBusiness.all
    @temp_agencies = TempAgency.all
  end

  def accept_user
    hood = @temp_user.hood
    neighborhood = Neighborhood.create(name: hood.name, address: hood.address)

    role = (if @temp_user.hoa then :hoa else :lead end)
    user = User.create(name: @temp_user.name,
                       neighborhood_id: neighborhood.id,
                       image_url: open('app/assets/images/placeholder.png'),
                       role: User.roles[role])

    user.account = Account.setup(user, @temp_user.email)

    respond_to do |format|
      if user.account
        @temp_user.hood.destroy
        @temp_user.destroy

        format.html { redirect_to admins_url }
      else
        user.destroy
        format.html { redirect_to admins_url, alert: 'failed to create user' }
      end

      @temp_users = TempUser.where(hood_type: 'TempNeighborhood')
      format.js { render action: 'rerender_prospective_users' }
    end
  end

  def deny_user
    @temp_user.hood.destroy
    @temp_user.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }

      @temp_users = TempUser.where(hood_type: 'TempNeighborhood')
      format.js { render action: 'rerender_prospective_users' }
    end
  end

  def accept_business

    business = Business.create(name: @temp_business.name,
                            address: @temp_business.address,
                            image_url: open('app/assets/images/placeholder.png'))

    business.account = Account.setup(business, @temp_business.email)

    respond_to do |format|
      if business.account
        @temp_business.destroy

        format.html { redirect_to admins_url }
      else
        business.destroy
        format.html { redirect_to admins_url, alert: 'failed to create business' }
      end

      @temp_businesses = TempBusiness.all
      format.js { render action: 'rerender_prospective_businesses' }
    end
  end

  def deny_business
    @temp_business.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }

      @temp_businesses = TempBusiness.all
      format.js { render action: 'rerender_prospective_businesses' }
    end
  end

  def accept_agency

    agency = Agency.create(name: @temp_agency.name,
                        address: @temp_agency.address,
                        image_url: open('app/assets/images/placeholder.png'))

    agency.account = Account.setup(agency, @temp_agency.email)

    respond_to do |format|
      if agency.account
        @temp_agency.destroy

        format.html { redirect_to admins_url }
      else
      agency.destroy
        format.html { redirect_to admins_url, alert: 'failed to create agency' }
      end

      @temp_agencies = TempAgency.all
      format.js { render action: 'rerender_prospective_agencies' }
    end
  end

  def deny_agency
    @temp_agency.destroy

    respond_to do |format|
      format.html { redirect_to admins_url }

      @temp_agencies = TempAgency.all
      format.js { render action: 'rerender_prospective_agencies' }
    end
  end

  def edit
  end

  def update
    update_account(@current_member, params[:updateParam], params)
  end

  private
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end

    def set_temp_business
      @temp_business = TempBusiness.find(params[:id])
    end

    def set_temp_agency
      @temp_agency = TempAgency.find(params[:id])
    end
end
