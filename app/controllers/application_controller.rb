class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  protected
    def authorize
      @current_user = User.find_by(id: session[:user_id])
      unless @current_user
        redirect_to login_url, notice: 'Log in required'
      end
    end
end
