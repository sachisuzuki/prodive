# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to mypage_user_url(user.id)
    flash[:notice] = "ゲスト(ユーザー)としてログインしました！"
  end

  def guest_admin_sign_in
    admin_user = User.guest_admin
    sign_in admin_user
    redirect_to mypage_user_url(admin_user.id)
    flash[:notice] = "ゲスト(管理者)としてログインしました！"
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    mypage_user_url(resource)
  end
end
