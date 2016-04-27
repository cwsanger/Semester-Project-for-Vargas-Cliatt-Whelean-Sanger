class PasswordRequest < ActiveRecord::Base
  def self.confirm(cn)
    request = find_by(key: cn)
    if request
      account = Account.find(request.account_id)
      account.request_new_pass
      request.destroy
      return true
    else
      return false
    end
  end
end
