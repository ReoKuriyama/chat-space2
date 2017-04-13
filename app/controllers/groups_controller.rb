class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)

  end
   private
  def group_params
    params.require(:group).permit(:group_name)
  end
end
