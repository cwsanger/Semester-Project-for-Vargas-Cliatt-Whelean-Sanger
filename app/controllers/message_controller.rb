class MessageController < ApplicationController
  def create
    @message = Message.new(body: params[:body],
                          user_id: @current_user.id)
  end
end
