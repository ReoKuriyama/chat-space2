class MessagesController < ApplicationController
  before_action :set_group
  def index
    @message = Message.new
    @groups = current_user.groups.includes(:messages)

    respond_to do |format|
      format.html
      format.json do
        @messages = @group.messages.where('id > ?', params[:last_message_id])
      end
    end
  end

  def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html do
          flash[:notice] = 'message has been sent'
          redirect_to group_messages_path(@group)
        end
        format.json
      else
        format.html do
          flash[:alert] = 'failed to send a message'
          render :index
        end
        format.json
      end
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params[:message][:body] = nil if params[:message][:body] == ''
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
