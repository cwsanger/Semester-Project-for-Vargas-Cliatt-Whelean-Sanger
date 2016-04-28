class DemoController < ApplicationController
  skip_before_action :authenticate

  def demo_list
    @users = User.all
    @agencies = Agency.all
    @businesses = Business.all
    @admins = Admin.all
  end

  def demo_login
    account = Account.find(params[:id])

    if account
      session[:account_id] = params[:id]

      if account.member_type == 'User'
        redirect_to account.member.neighborhood
      elsif account.member_type == 'Admin'
        redirect_to admins_url
      else
        redirect_to account.member
      end

    end
  end

end
