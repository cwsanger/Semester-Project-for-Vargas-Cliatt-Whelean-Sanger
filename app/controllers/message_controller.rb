class MessageController < ApplicationController
  before_action :set_group

  def create
    @message = Message.new(body: params[:body],
                          user_id: @current_member.id,
                          group_id: @group.id)

    if @message.save
      redirect_to @group
    else
      redirect_to @group, notice: 'message creation failed'
    end
  end

  private
    def set_group
      @group = Group.find(params[:group_id])
    end
end
