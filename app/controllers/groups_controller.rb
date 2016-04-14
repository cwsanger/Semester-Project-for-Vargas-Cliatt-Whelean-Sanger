class GroupsController < ApplicationController
  include CurrentGroups
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_groups, only: [:index, :show]

  # GET /groups
  # GET /groups.json
  def index
    auth Group
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    auth @group
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(name: params[:name],
                       neighborhood_id: @current_member.neighborhood_id)

    @group.users << @current_member

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
    @group = Group.find(params[:group_id])
    user = User.find(params[:user_id])

    @group.users << user

    respond_to do |format|
      format.html { redirect_to @group }
      format.json { head :no_content }
    end
  end

  def remove_user
    @group = Group.find(params[:group_id])
    @group.users.delete(@current_member)

    if @group.save
      if @group.users.empty?
        @group.destroy
      end

      redirect_to groups_url
    else
      redirect_to @group, notice: 'failed to leave group'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.permit(:name)
    end
end
