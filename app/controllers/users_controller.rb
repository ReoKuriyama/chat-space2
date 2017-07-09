class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @keyword = params[:keyword]
    if @keyword.blank?
      @users  = []
    else
      @users = User.where('title LIKE(?)', "%#{params[:keyword]}%")
      respond_to do |format|
        format.html
        format.json
      end
   end
  end
end
