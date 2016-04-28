class SuperuniqueValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if Account.exists?(email: value) ||
       TempUser.exists?(email: value) ||
       TempAgency.exists?(email: value) ||
       TempBusiness.exists?(email: value)
      record.errors[attribute] << (options[:message] || "that email is already in use.")
    end
  end
end

