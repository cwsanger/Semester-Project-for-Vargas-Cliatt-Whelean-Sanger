class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :flag, :remove_flag]

  def create
    @current_member.post(post_params)
    @posts = Post.joins(:user)
                 .where(users: { neighborhood_id: @current_member.neighborhood_id })
                 .order(created_at: :desc)

    respond_to do |format|
      if @current_member.save
        format.html { redirect_to @current_member.neighborhood }
        format.js
      else
        format.html { redirect_to @current_member.neighborhood, notice: 'you are bad' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @post.destroy
    @posts = Post.where(status: Post.statuses[:flag])

    respond_to do |format|
      format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
      format.js { render action: 'rerender_flagged_posts' }
    end
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
          format.js { render action: 'flag' }
        else
          format.html { redirect_to @current_member.neighborhood, alert: 'you are bad' }
          format.js { render action: 'flag' }
      end
    end
  end

  def flag
    @post.flag!
    @posts = Post.all

    respond_to do |format|
      if @post.save
        format.js
      else
        format.js
      end
    end
  end

  def remove_flag
    @post.no_flag!
    @posts = Post.where(status: Post.statuses[:flag])

    respond_to do |format|
      if @post.save
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
        format.js { render action: 'rerender_flagged_posts' }
      else
        format.html { redirect_to neighborhood_admin_url(@current_member.neighborhood) }
        format.js { render action: 'rerender_flagged_posts' }
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
