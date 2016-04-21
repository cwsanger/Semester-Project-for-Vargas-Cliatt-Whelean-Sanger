class SignupsController < ApplicationController
  skip_before_action :authenticate

  before_action :set_neighborhood, only: [:join, :register_user]

  def temps
    @temp_users = TempUser.all
    @temp_neighborhoods = TempNeighborhood.all
    @temp_businesses = TempBusiness.all
    @temp_agencies = TempAgency.all
  end

  def create_business
    @temp_business = TempBusiness.new(temp_business_params)

    respond_to do |format|
      if @temp_business.save
        format.html { redirect_to root_path, notice: 'You should be approved soon' }
      else
        format.html { redirect_to root_path, alert: 'You should be approved soon' }
      end
    end
  end

  def create_agency
    @temp_agency = TempAgency.new(temp_agency_params)

    respond_to do |format|
      if @temp_agency.save
        format.html { redirect_to root_path, notice: 'You should be approved soon' }
      else
        format.html { redirect_to root_path, alert: 'You should be approved soon' }
      end
    end
  end

  def create
    @temp_neighborhood = TempNeighborhood.new(temp_neighborhood_params)
    @temp_neighborhood.temp_users.build(temp_user_params)

    respond_to do |format|
      if @temp_neighborhood.save
        format.html { redirect_to root_path, notice: 'You should be approved soon' }
      else
        format.html { redirect_to root_path, alert: 'Failed to register' }
      end
    end
  end

  def join
    @neighborhood.temp_users.build(temp_user_params)

    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to root_path, notice: 'You should be approved soon' }
        format.json { render :show, status: :created, location: @registrant }
      else
        format.html { render :register_user }
        format.json { render json: @registrant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def temp_user_params
      params.require(:temp_user).permit(:name, :email, :image_url)
    end

    def temp_neighborhood_params
      params.require(:temp_neighborhood).permit(:name, :address)
    end

    def temp_business_params
      params.require(:temp_business).permit(:name, :email, :address, :image_url)
    end

    def temp_agency_params
      params.require(:temp_agency).permit(:name, :email, :address, :image_url)
    end

    def set_neighborhood
      puts params[:id]
      @neighborhood = Neighborhood.find_by_slug(params[:id])
    end
end
