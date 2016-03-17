class AdvertisementController < ApplicationController
  before_action :set_advertisement, only: [:like]

  def create
  end

  def destroy
  end

  def edit
  end

  def like
    @advertisement.like

    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @current_user.neighborhood }
      else
        format.html { redirect_to @current_user.neighborhood, notice: 'like ad failed' }
      end
    end
  end

  private
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end
end
