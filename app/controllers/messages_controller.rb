class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.group = @group
    @message.user = current_user
     if @message.save
      flash[:notice] = "message has been sent"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "failed to sent a message"
      render :root
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
