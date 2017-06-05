class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @message = Message.new
    @groups = current_user.groups.includes(:messages)
  end

  def create
    @message = @group.messages.new(message_params)
     if @message.save
      flash[:notice] = "message has been sent"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "failed to sent a message"
      render :index
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
