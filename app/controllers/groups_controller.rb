class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "グループが作成されました。"
      redirect_to :root
    else
      flash[:alert] = "グループの作成に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "グループが更新されました"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "グループの更新に失敗しました。"
      render :edit
    end
  end

   private

  def set_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:group_name, {user_ids: []})
  end
end
