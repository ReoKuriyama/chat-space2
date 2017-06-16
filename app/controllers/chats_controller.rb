class ChatsController < ApplicationController
  def index
    @groups = current_user.groups.includes(:messages)
  end
end
