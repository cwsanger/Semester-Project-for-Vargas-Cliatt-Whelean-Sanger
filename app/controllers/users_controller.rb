class UsersController < ApplicationController
  include UpdateHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @users = @users.sort_by( &:neighborhood )
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    """
        We don't know the name of the parameter that needs to be updated
        so updateParam is also passed to this method and its value is
        the name of that unknown parameter.

        e.g. params: {updateParam: 'email', email: 'myNewEmail@email.com'}
        e.g. params: {updateParam: 'name', name: 'Kristofur Kolowmbust'}

    """

    update_account(@current_member, params[:updateParam], params)
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:updateParam, :email, :name, :password, :password_confirmation)
    end

    def account_params
      params.require(:account).permit(:updateParam, :image_url, :email)
    end
end
