class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = current_user
    @gift = current_user.gift || Gift.create({user_id: @user.id})
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
