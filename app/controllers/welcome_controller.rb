class WelcomeController < ApplicationController
  skip_before_action :authenticate

  def start
  end

  def post_start
    redirect_to "/welcome/search"
  end

  def admin_login
    if account_validated?(Admin)
      redirect_to admins_url
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def business_login
    if account_validated?(Business)
      redirect_to @member
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def agency_login
    if account_validated?(Agency)
      redirect_to @member
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def user_login
    if account_validated?(User)
      neighborhood = Neighborhood.find(@member.neighborhood_id)
      redirect_to neighborhood
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def logout
    session[:account_id] = nil
    redirect_to login_path, notice: "Logout Successfull"
  end

  def search

    @neighborhoods = Neighborhood.all

    if params[:search]
      @neighborhoods = Neighborhood.where("name LIKE ? or address LIKE ?",
                                          params[:search], params[:search])
    end

    @hash = Gmaps4rails.build_markers(@neighborhoods) do |neighborhood, marker|
      marker.lat neighborhood.latitude
      marker.lng neighborhood.longitude
      marker.title neighborhood.name
    end
  end

  private
    def account_validated?(type)
      account = Account.find_by(email: params[:email])
      if account and account.authenticate(params[:password])
        @member = account.member

        if @member.is_a? type
          session[:account_id] = account.id
          return true
        end
      end

      return false
    end
end
