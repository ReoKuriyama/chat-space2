class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @message = Message.new
    @groups = current_user.groups.includes(:messages)
  end

  def create
    @group.messages.new(message_params)
     if @message.save
      flash[:notice] = "message has been sent"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "failed to sent a message"
      render :index
    end
  end

  private

  def message_params
    @message.user = current_user
    params.require(:message).permit(:body)
  end
end
