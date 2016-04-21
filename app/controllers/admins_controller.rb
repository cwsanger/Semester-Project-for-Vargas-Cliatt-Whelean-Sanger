class AdminsController < ApplicationController
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
    user = User.create(name: @temp_user.name, neighborhood_id: neighborhood.id, image_url: open('app/assets/images/placeholder.png'))
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

  def deny_user
    @temp_user.hood.destroy
    @temp_user.destroy

    redirect_to admins_url
  end

  def accept_business
    business = Business.new(name: @temp_business.name, address: @temp_business.address, image_url: open('app/assets/images/placeholder.png'))
    business.build_account(email: @temp_business.email,
                           password: 'password',
                           password_confirmation: 'password')

    if business.save
      @temp_business.destroy

      redirect_to admins_url
    else
      redirect_to admins_url, alert: 'failed to create business'
    end
  end

  def deny_business
    @temp_business.destroy

    redirect_to admins_url
  end

  def accept_agency
    agency = Agency.new(name: @temp_agency.name, address: @temp_agency.address, image_url: open('app/assets/images/placeholder.png'))
    agency.build_account(email: @temp_agency.email,
                         password: 'password',
                         password_confirmation: 'password')

    if agency.save
      @temp_agency.destroy

      redirect_to admins_url
    else
      redirect_to admins_url, alert: 'failed to create agency'
    end
  end

  def deny_agency
    @temp_agency.destroy

    redirect_to admins_url
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
