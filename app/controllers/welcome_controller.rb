class WelcomeController < ApplicationController
  skip_before_action :authenticate
  before_action :registration

  def start
  end

  def admin_login
    if account_validated?(Admin)
      redirect_to admins_url
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def business_login
    if account_validated?(Business)
      redirect_to @member
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def agency_login
    if account_validated?(Agency)
      redirect_to @member
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def user_login
    if account_validated?(User)
      neighborhood = Neighborhood.find(@member.neighborhood_id)
      redirect_to neighborhood
    else
      redirect_to login_path, alert: "Invalid email/password combination"
    end
  end

  def logout
    session[:account_id] = nil
    redirect_to login_path, notice: "Logout Successfull"
  end

  def search

    #Current functionality:
    # Neighborhoods are returned if they pass the search_matches function.
    # Pass search_matches the search string and a list of fields to test.
    # Right now the only fields tested against are name and address.

    @neighborhoods = Neighborhood.all.to_a

    if params[:search]
      @neighborhoods.delete_if { |neighborhood|
        !search_matches(
          params[:search], [neighborhood.name, neighborhood.address]
        )
      }
    end

    @hash = Gmaps4rails.build_markers(@neighborhoods) do |neighborhood, marker|
      marker.lat neighborhood.latitude
      marker.lng neighborhood.longitude
      marker.title neighborhood.name
    end
  end

  private

    def search_matches(searchString, fields)

      # Returns true if the searchString is in any of the fields or
      # if any of the fields are in the searchString, ignoring case.
      # I did the second case for examples this like:
      #   search="Kanto, Japan" should still return the neighborhood "Kanto"
      #
      # We should implement a gem or algorithm to handle spelling mistakes

      searchString = searchString.downcase
      fields.map!(&:downcase)

      fields.each do |field|
        if (
            (field.include? searchString) ||
            (searchString.include? field)
           )
          return true
        end
      end

      return false
    end

    def account_validated?(type)
      account = Account.find_by(email: params[:email])
      if account and account.authenticate(params[:password])
        @member = account.member

        if @member.is_a? type
          session[:account_id] = account.id
          return true
        end
      end

      return false
    end

    def registration
      @temp_user = TempUser.new
      @temp_neighborhood = TempNeighborhood.new
      @temp_business = TempBusiness.new
      @temp_agency = TempAgency.new
    end
end
