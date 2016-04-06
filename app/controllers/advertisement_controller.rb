class AdvertisementController < ApplicationController
  before_action :set_advertisement, only: [:like]

  def create
    @advertisement = Advertisement.new(body: params[:body],
                     business_id: @current_member.id)
    respond_to do |format|
     if @advertisement.save
       format.html { redirect_to @current_member }
     else
       format.html { redirect_to @current_member, notice: 'you are worse' }
       format.json { render json: @post.errors, status: :unprocessable_entity }
     end
    end
  end

  def destroy
  end

  def edit
  end

  def like
    @current_member.like(@advertisement)

    respond_to do |format|
      if @current_member.save
        format.html { redirect_to @current_member.neighborhood }
      else
        format.html { redirect_to @current_member.neighborhood, notice: 'like ad failed' }
      end
    end
  end

  private
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end
end
