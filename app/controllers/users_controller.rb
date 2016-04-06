class UsersController < ApplicationController
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

        params[:updateParam] gives us the string value of the name of the
        unknown parameter and so we can use that to get value of the unknown
        parameter with params[ params[:updateParam] ]

    """

    paramName = params[:updateParam]
    paramValue = params[ paramName ]

      #Make sure the parameter to be updated is one we have whitelisted
      if ['name', 'email', 'address'].include? paramName and not paramValue.empty?

        if paramName == 'email'
          @current_member.account.update_attribute(paramName, paramValue)
          notice = 'good job, admin was updated'
        else
          @current_member.update_attribute(paramName, paramValue)
          notice = 'good job, user was updated'
        end
      elsif paramValue.empty?
        notice = 'Your ' + paramName + ' can not be blank.'
      else
        notice = 'Unexpected parameter'
      end

      respond_to do |format|
        format.html { redirect_to edit_user_path(@current_member), notice: notice }
        format.json { render :edit, status: :ok, location: @current_member }
      end

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
      params.require(:account).permit(:updateParam, :email)
    end
end
