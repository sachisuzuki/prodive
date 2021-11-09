module UsersHelper
  def set_avatar_helper
    if current_user.avatar?
      current_user.avatar.url
    else
      '/images/default-avatar.png'
    end
  end

  def complete_profile_helper
    'プロフィールを完成するには『プロフィール編集』' if current_user.avatar.blank? || current_user.shop.blank?
  end
end
