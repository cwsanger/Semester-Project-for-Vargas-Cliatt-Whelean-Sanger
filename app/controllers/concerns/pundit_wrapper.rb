module PunditWrapper
  extend ActiveSupport::Concern

  include Pundit

  def auth(arg, policy: nil)
    if policy.nil?
      authorize arg
    else
      unless policy.new(pundit_user, arg).public_send(params[:action] + '?')
        raise Pundit::NotAuthorizedError
      end
    end
  end

  private
    def pundit_user
      @current_member
    end
end
