class AdvertisementController < ApplicationController
  before_action :set_advertisement, only: [:like]

  def create
    @advertisement = Advertisement.new(body: params[:advertisement][:body],
                                       business_id: params[:advertisement][:business_id],
                                       image_url: params[:advertisement][:image_url])


    respond_to do |format|
     if @advertisement.save
       format.html { redirect_to @current_member, notice: 'Ad created' }
     else
       format.html { redirect_to @current_member, notice: 'Ad could not be created' }
       format.json { render json: @post.errors, status: :unprocessable_entity }
     end
    end
  end

  def destroy
  end

  def edit
  end

  def like
    unless @advertisement.has_like(@current_member)
      @current_member.like(@advertisement)
    else
      @current_member.unlike(@advertisement)
    end

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

    def advertisement_params
      params.require(:advertisement).permit(:business_id, :body, :image_url)
    end

end
