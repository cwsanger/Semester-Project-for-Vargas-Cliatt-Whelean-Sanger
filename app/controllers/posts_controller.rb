class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

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
    @current_member.like(@post)

    respond_to do |format|
      if @current_member.save
          format.html { redirect_to @current_member.neighborhood }
        else
          format.html { redirect_to @current_member.neighborhood, notice: 'you are bad' }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :category_id)
    end
end
