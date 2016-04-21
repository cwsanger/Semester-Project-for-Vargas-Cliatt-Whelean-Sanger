class Account < ActiveRecord::Base
  has_secure_password

  belongs_to :member, polymorphic: true

  validates :email, presence: true, uniqueness: true, email: true
  # Only for testing the email sending feature,
  # uncomment below, comment out above
  #validates :email, presence: true, email: true

  def self.random_pass
    #('!'..'~').to_a.shuffle[0,8].join
    'asspass'
  end

  def self.setup(member, email)
    pass = random_pass
    account = create(email: email, password: pass, password_confirmation: pass)

    if account

      type = 'User'
      if member.is_a? Business
        type = 'Business'
      elsif member.is_a? Agency
        type = 'Agency'
      end

      AccountNotifier.created(member, email, pass).deliver_now
    end
    account
  end

end
