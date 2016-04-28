class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:destroy, :like, :flag, :remove_flag]

  def create
    @current_member.comment(@post, comment_params)

    respond_to do |format|
      if @current_member.save
        format.html { redirect_to @current_member.neighborhood }
        format.js
      else
        format.html { redirect_to @current_member,neighborhood, notice: 'your comments are bad' }
        format.js
      end
    end
  end

  def like
    unless @comment.has_like(@current_member)
      @current_member.like(@comment)
    else
      @current_member.unlike(@comment)
    end

    respond_to do |format|
      if @current_member.save
        format.html { redirect_to @current_member.neighborhood }
        format.js { render action: 'rerender_comment' }
      else
        format.html { redirect_to @currnet_user.neighborhood, notice: 'your like was bad' }
        format.js { render action: 'rerender_comment' }
      end
    end

  end

  def flag
    @comment.flag!

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @current_member.neighborhood }
        format.js { render action: 'rerender_comment' }
      else
        format.html { redirect_to @current_member.neighborhood, alert: 'you are bad' }
        format.js { render action: 'rerender_comment' }
      end
    end
  end

  def remove_flag
    @comment.no_flag!
    @comments = Comment.where(status: Comment.statuses[:flag])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
        format.js { render action: 'rerender_flagged_comments' }
      else
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
        format.js { render action: 'rerender_flagged_comments' }
      end
    end
  end

  def destroy
    @comment.destroy
    @comments = Comment.where(status: Comment.statuses[:flag])

    respond_to do |format|
      format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
      format.js { render action: 'rerender_flagged_comments' }
    end
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
