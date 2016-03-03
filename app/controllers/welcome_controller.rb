class WelcomeController < ApplicationController
  skip_before_action :authorize

  def start
  end

  def post_start
    redirect_to "/welcome/search"
  end

  def login

  end

  def post_login
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      neighborhood = Neighborhood.find(user.neighborhood_id)
      redirect_to neighborhood
    else
      redirect_to login_path
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
end
