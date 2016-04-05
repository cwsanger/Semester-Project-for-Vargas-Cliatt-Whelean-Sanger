class BroadcastsController < ApplicationController
  before_action :set_neighborhood

  def create
    @neighborhood.broadcasts.build(broadcast_params)

    if @neighborhood.save
      redirect_to neighborhood_admin_url(@neighborhood)
    else
      redirect_to neighborhood_admin_url(@neighborhood), notice: 'notice'
    end
  end

  def destroy
  end

  def edit
  end

  private
    def broadcast_params
      params.require(:broadcast).permit(:body)
    end

    def set_neighborhood
      @neighborhood = Neighborhood.find_by_slug(params[:neighborhood_id])
    end
end
