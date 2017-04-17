class GroupsController < ApplicationController
  before_action :find_group, only: [:edit, :update]
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "グループが作成されました。"
      redirect_to :root
    else
      flash[:notice] = "グループの作成に失敗しました。"
      redirect_to :new
    end
  end

  def find_group
     @group = Group.find(params[:id])
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:notice] = "グループが更新されました"
      redirect_to :root
    else
      flash[:notice] = "グループの更新に失敗しました。"
      redirect_to :edit
    end
  end
   private
  def group_params
    params.require(:group).permit(:group_name)
  end
end
