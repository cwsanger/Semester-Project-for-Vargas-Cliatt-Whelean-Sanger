class PostController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def create
    @post = Post.new(body: params[:body],
                     category_id: params[:category_id],
                     user_id: @current_member.id)

    respond_to do |format|
      if @post.save
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

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
