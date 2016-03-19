class CommentController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:like]

  def create
    @post.comments.build(comment_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @current_user.neighborhood }
      else
        format.html { redirect_to @current_user,neighborhood, notice: 'your comments are bad' }
      end
    end
  end

  def like
    @comment.like @current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @current_user.neighborhood }
      else
        format.html { redirect_to @currnet_user.neighborhood, notice: 'your like was bad' }
      end
    end

  end

  def destroy
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def comment_params
      params.permit(:body)
    end
end
