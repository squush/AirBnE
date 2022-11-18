class UsersController < ApplicationController
  def profile
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :bio)
  end
end
