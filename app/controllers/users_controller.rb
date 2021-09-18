class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show mypage myprofile myfavorite ]
  def show
    @conditions = Condition.where(user_id: @user.id).order(created_at: :DESC)
  end
  def mypage
    @favorites = current_user.favorites.all
    @followed = Relationship.where(follower_id: @user.id)
    unless current_user.id == params[:id].to_i
      redirect_to mypage_user_path(current_user.id)
      flash[:alert] = "お探しのページは見つかりません"
    else
      @favorites = current_user.favorites.all
    end
  end
  def myprofile
    respond_to do |format|
      format.js { render :myprofile }
      format.html { redirect_to mypage_user_path(current_user.id) }
    end
  end
  def myfavorite
    @favorites = current_user.favorites.all
    @followed = Relationship.where(follower_id: @user.id)
    respond_to do |format|
      format.js { render :myfavorite }
      format.html { redirect_to mypage_user_path(current_user.id) }
    end
  end
  def mypost
    @conditions = current_user.conditions.all.order(created_at: :DESC)
    respond_to do |format|
      format.js { render :mypost }
      format.html { redirect_to mypage_user_path(current_user.id) }
    end
  end
  private
  def user_params
    params.reguire(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
  def set_user
    user = User.all.pluck(:id)
    @user = User.find(params[:id]) if params[:id].to_i.in?(user)
  end
end
