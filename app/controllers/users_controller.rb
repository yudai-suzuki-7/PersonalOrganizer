class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to users_path
  end
end
