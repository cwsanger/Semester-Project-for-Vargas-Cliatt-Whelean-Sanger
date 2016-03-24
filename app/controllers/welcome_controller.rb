class WelcomeController < ApplicationController
  skip_before_action :authorize

  def start
  end

  def post_start
    redirect_to "/welcome/search"
  end

  def admin_login

  end

  def business_login
    if account_validated?(Business)
      business = Business.find(@member.business_id)
      redirect_to business
    else
      redirect_to login_path, alert: "Invalid user/password combination"
    end
  end

  def agency_login

  end

  def user_login
    if account_validated?(User)
      neighborhood = Neighborhood.find(@member.neighborhood_id)
      redirect_to neighborhood
    else
      redirect_to login_path, alert: "Invalid user/password combination"
    end
  end

  def search
    @neighborhoods = Neighborhood.all
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
