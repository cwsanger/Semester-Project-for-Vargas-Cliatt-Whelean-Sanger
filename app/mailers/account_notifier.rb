class AccountNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_notifier.created.subject
  #
  def created(type, email, password)
    @password = password
    @type = type

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
    @greeting = "Hi"

    mail to: account.email, subject: 'Account was updated' do |format|
      format.html
    end

  end
end
