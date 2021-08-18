class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.reguire(:user).permit(:name, :email,)
  end
end
