module UpdateHelper

  def update_account(user, attribute, parameters)

    #For testing
    #puts "Received update request!\n---------------------------\n"
    #puts "Attribute - #{attribute}\n"
    #puts "Value - #{parameters[attribute]}\n"
    #puts "--------------------------\n\n\n"

    #Make sure the attribute is valid, i.e. - email, address, not ID etc
    if editable attribute

      #Make sure the new value is valid, i.e. - the string is an address
      if valid(attribute, parameters)
        value = parameters[attribute]
        attribute_name = name_for attribute
        success = false

        #Special case for password
        if attribute == 'password'
          if user.account.change_pass(parameters[:old_pass],
                                      parameters[:new_pass])
            success = true
          end

        #Special case for email,
        elsif attribute == 'email'
          if user.account.update_attribute(attribute, value)
            success = true
          end

        else
          if user.update_attribute(attribute, value)
            success = true
          end
        end

        #Set notice and alert for respond_to block
        if success
          notice = "Successfully changed your #{attribute_name}."
        else
          alert = "You must supply a valid #{attribute_name}."
        end

      else
        alert "You must supply a valid #{attribute_name}."
      end

    #Somehow, we received a request to edit an attribute
    #that either doesn't exist or isn't editable
    else
      alert = 'Oops, something went wrong'
    end

    respond_to do |format|
      if user.is_a? User
        format.html { redirect_to edit_user_path(user),
                      notice: notice, alert: alert }
      elsif user.is_a? Agency
        format.html { redirect_to edit_agency_path(user),
                      notice: notice, alert: alert }
      elsif user.is_a? Admin
        format.html { redirect_to edit_admin_path(user),
                      notice: notice, alert: alert }
      else
        format.html { redirect_to edit_business_path(user),
                      notice: notice, alert: alert }
      format.json { render :edit, status: ok, location: user }
      end
    end

  end

  def valid(attribute, parameters)
    true
  end

  def user_attributes
    {'name' => 'name',
     'address' => 'street address',
     'image_url' => 'profile picture',
     'email' => 'email address',
     'password' => 'password'}
  end

  def editable(attribute)
    user_attributes.keys.include? attribute
  end

  def name_for(attribute)
    user_attributes[attribute]
  end

end
