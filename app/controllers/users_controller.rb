class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @keyword = params[:name]
    if @keyword.blank?
      @users  = []
    else
      @users = User.where('name LIKE(?)', "%#{params[:name]}%")
    end
    respond_to do |format|
      format.json
    end
  end
end
