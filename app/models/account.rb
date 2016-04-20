class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :member, polymorphic: true

  validates :email, presence: true, uniqueness: true, email: true

  def self.random_pass
    #('!'..'~').to_a.shuffle[0,8].join
    'asspass'
  end

  def self.setup(email)
    pass = random_pass
    account = create(email: email, password: pass, password_confirmation: pass)
    if account
      AccountNotifier.created(account).deliver_now
    end
    account
  end

end
