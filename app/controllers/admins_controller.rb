class AdminsController < ApplicationController
  before_action :set_temp_user, only: [:accept_user, :deny_user]
  before_action :set_temp_business, only: [:accept_business, :deny_business]
  before_action :set_temp_agency, only: [:accept_agency, :deny_agency]

  def index
    @temp_users = TempUser.where(hood_type: 'TempNeighborhood')
    @temp_businesses = TempBusiness.all
    @temp_agencies = TempAgency.all
  end

  def accept_user
    hood = @temp_user.hood
    neighborhood = Neighborhood.create(name: hood.name, address: hood.address)
    user = User.create(name: @temp_user.name, neighborhood_id: neighborhood.id)

    safe_pass = Account.random_pass

    user.build_account(email: @temp_user.email,
                       password: safe_pass,
                       password_confirmation: safe_pass)

    if user.save
      @temp_user.hood.destroy
      @temp_user.destroy

      AccountNotifier.created(user.account).deliver

      redirect_to admins_url
    else
      redirect_to admins_url, alert: 'failed to create user'
    end
  end

  def test_accept_user(test_user)
    user = User.create(name: test_user.name)

    safe_pass = Account.random_pass
    user.build_account(email: test_user.email,
                       password: safe_pass,
                       password_confirmation: safe_pass)

    if user.save
      AccountNotifier.created(user.account).deliver
      puts "User saved, emailing #{user.account.email}"
    else
      puts "User not saved! No email for #{user.account.email}"
    end
  end

  def deny_user
    @temp_user.hood.destroy
    @temp_user.destroy

    redirect_to admins_url
  end

  def accept_business
    business = Business.new(name: @temp_business.name)
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
    agency = Agency.new(name: @temp_agency.name)
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
