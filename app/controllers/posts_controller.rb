class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :flag, :remove_flag]

  def create
    @current_member.post(post_params)

    respond_to do |format|
      if @current_member.save
        format.html { redirect_to @current_member.neighborhood }
      else
        format.html { redirect_to @current_member.neighborhood, notice: 'you are bad' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    redirect_to neighborhood_admin_url(@current_member.neighborhood)
  end

  def edit
    respond_to do |format|
      if @post.update(post_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def like
    unless @post.has_like(@current_member)
      @current_member.like(@post)
    else
      @current_member.unlike(@post)
    end

    respond_to do |format|
      if @current_member.save
          format.html { redirect_to @current_member.neighborhood }
        else
          format.html { redirect_to @current_member.neighborhood, alert: 'you are bad' }
      end
    end
  end

  def flag
    @post.flag!

    respond_to do |format|
      if @post.save
        format.html { redirect_to @current_member.neighborhood }
      else
        format.html { redirect_to @current_member.neighborhood, alert: 'you are bad' }
      end
    end
  end

  def remove_flag
    @post.no_flag!

    respond_to do |format|
      if @post.save
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
      else
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :category_id, :image_url)
    end
end
