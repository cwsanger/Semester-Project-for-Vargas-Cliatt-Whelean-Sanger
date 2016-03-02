class PostController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def create
    print "\n\n\n\n\n\n\n\n\n\n\nMATT IS HERE\n\n\n\n\n\n\n\n\n\n\n\n"

    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.json { render :show, status: :created }
      else
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

    def post_params
      params.require(:post).permit(:body)
    end

end
