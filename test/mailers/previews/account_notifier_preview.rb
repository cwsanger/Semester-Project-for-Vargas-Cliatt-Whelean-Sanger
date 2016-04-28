# Preview all emails at http://localhost:3000/rails/mailers/account_notifier
class AccountNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/account_notifier/created
  def created
    AccountNotifier.created
  end

  # Preview this email at http://localhost:3000/rails/mailers/account_notifier/updated
  def updated
    AccountNotifier.updated
  end

end
