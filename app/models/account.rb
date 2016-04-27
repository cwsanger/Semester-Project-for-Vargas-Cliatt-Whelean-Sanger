class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :member, polymorphic: true

  validates :email, presence: true, uniqueness: true, email: true

  def self.random_pass
    ('!'..'~').to_a.shuffle[0,8].join
  end

  def self.random_key
    chars = ('0'..'9').to_a * 10
    chars.shuffle[0,31].join
  end

  def self.setup(member, email)
    pass = random_pass
    account = new(email: email, password: pass, password_confirmation: pass)

    if account.save
      type = 'User'

      if member.is_a? Business
        type = 'Business'
      elsif member.is_a? Agency
        type = 'Agency'
      end

      AccountNotifier.created(member, email, pass).deliver_now
    else
      puts "\n\n\nACCOUNT.SETUP COULD NOT MAKE THE #{type} ACCOUNT\n\n"
    end

    account
  end

  def change_pass(old_pass, new_pass)
    if !self.authenticate(old_pass)
      return false
    end

    self.password = new_pass
    self.save

    return true
  end

  def request_new_pass
    new_pass = Account.random_pass

    self.password = new_pass
    self.save

    AccountNotifier.password_requested(self.email, new_pass).deliver_now
  end

  def request_reset_pass
    request = PasswordRequest.create(account_id: self.id, key: Account.random_key)
    AccountNotifier.password_reset(self.email, request.key).deliver_now
  end

end
