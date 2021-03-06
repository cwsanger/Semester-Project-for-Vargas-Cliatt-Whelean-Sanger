class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PunditWrapper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  before_action :authenticate

  def pundit_user
    @current_member
  end

  protected
    def authenticate
      @current_account = Account.find_by(id: session[:account_id])

      if @current_account
        @current_member = @current_account.member
      else
        redirect_to login_url, notice: 'Log in required'
      end
    end

  private
    def user_not_authorized
      redirect_to(request.referrer || root_path)
    end
end
