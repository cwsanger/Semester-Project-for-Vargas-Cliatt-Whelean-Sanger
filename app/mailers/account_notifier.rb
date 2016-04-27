class AccountNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_notifier.created.subject
  #
  def created(member, email, password)
    @password = password
    @type = 'User'
    @name = member.name

    if member.is_a? Business
      @type = 'Business'
    elsif member.is_a? Agency
      @type = 'Agency'
    end

    mail to: email, subject: 'Account created' do |format|
      format.html
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_notifier.updated.subject
  #
  def updated(account)

    mail to: account.email, subject: 'Account was updated' do |format|
      format.html
    end

  end


  def password_requested(email, password)

    @password = password

    mail to: email, subject: 'New password requested' do |format|
      format.html
    end

  end

  def password_reset(email, str)
    @str = str

    mail to: email, subject: 'Password reset instructions' do |format|
      format.html
    end
  end

  def became_lead(user)
    @name = user.name
    @neighborhood = user.neighborhood.name
    mail to: user.account.email, subject: "You've got a new role!" do |format|
      format.html
    end
  end

  def lost_lead(user)
    @name = user.name
    @neighborhood = user.neighborhood.name
    mail to: user.account.email, subject: "You've lost the lead role!" do |format|
      format.html
    end
  end

end
