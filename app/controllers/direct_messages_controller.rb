class DirectMessagesController < ApplicationController
  include CurrentGroups
  before_action :set_to_user, only: [:show, :create]
  before_action :set_groups, only: [:show]

  def create
    @current_member.sent_messages.build(direct_message_params.merge(to_id: @to_user.id))
    if @current_member.save
      redirect_to direct_message_url(@to_user)
    else
      redirect_to direct_message_url(@to_user, notice: 'message creation failed')
    end
  end

  def show
    @messages = DirectMessage.where(to_id: [@current_member.id, @to_user.id])
                             .where(from_id: [@current_member.id, @to_user.id])
                             .order(:created_at)
    @message = DirectMessage.new
  end


  private
    def set_to_user
      @to_user = User.find(params[:id])
    end

    def direct_message_params
      params.permit(:body,:image_url)
    end
end
