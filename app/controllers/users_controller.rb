class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show mypage myprofile myfavorite ]
  def show
    if @user.nil?
      redirect_to root_url
      flash[:alert] = "お探しのページは見つかりません"
    else
      @conditions = Condition.where(user_id: @user.id).order(created_at: :DESC)
      @conditions = @conditions.page(params[:page]).per(10)
    end
  end
  def mypage
    unless current_user.uid == params[:id]
      redirect_to root_url
      flash[:alert] = "お探しのページは見つかりません"
    else
      @favorites = current_user.favorites.all
      @followed = Relationship.where(follower_id: @user.id)
    end
  end
  def myprofile
    respond_to do |format|
      format.js { render :myprofile }
      format.html { redirect_to mypage_user_path(current_user.uid) }
    end
  end
  def myfavorite
    @favorites = current_user.favorites.all.order(created_at: :DESC)
    @followed = Relationship.where(follower_id: @user.id).order(created_at: :DESC)
    respond_to do |format|
      format.js { render :myfavorite }
      format.html { redirect_to mypage_user_path(current_user.uid) }
    end
  end
  def mypost
    @conditions = current_user.conditions.all.order(created_at: :DESC)
    @conditions = @conditions.page(params[:page]).per(10)
    respond_to do |format|
      format.js { render :mypost }
      format.html { redirect_to mypage_user_path(current_user.uid) }
    end
  end
  private
  def user_params
    params.reguire(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
  def set_user
    user = User.all.pluck(:uid)
    @user = User.find_by(uid: params[:id]) if params[:id].in?(user)
  end
end
