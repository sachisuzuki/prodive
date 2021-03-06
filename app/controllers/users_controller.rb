# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show
    if @user.nil?
      redirect_to root_url
      flash[:alert] = 'お探しのページは見つかりません'
    else
      @conditions = @user.conditions.includes(:divesite).order(created_at: :DESC)
      @conditions = @conditions.page(params[:page]).per(10)
    end
  end

  def mypage
    if current_user.uid == params[:id]
      @favorites = current_user.favorites.includes(:divesite).order(created_at: :DESC)
      @followed = current_user.follower.includes(:followed).order(created_at: :DESC)
    else
      redirect_to root_url
      flash[:alert] = 'お探しのページは見つかりません'
    end
  end

  def myprofile
    respond_to do |format|
      format.js { render :myprofile }
      format.html { redirect_to mypage_user_path(current_user.uid) }
    end
  end

  def myfavorite
    @favorites = current_user.favorites.includes(:divesite).order(created_at: :DESC)
    @followed = current_user.follower.includes(:followed).order(created_at: :DESC)
    respond_to do |format|
      format.js { render :myfavorite }
      format.html { redirect_to mypage_user_path(current_user.uid) }
    end
  end

  def mypost
    @conditions = current_user.conditions.order(created_at: :DESC)
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
