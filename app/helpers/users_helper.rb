module UsersHelper
  def set_avatar_helper
    if current_user.avatar?
      current_user.avatar.url
    else
      '/images/default-avatar.png'
    end
  end
  def set_avatar_panorama_helper
    if current_user.avatar?
      current_user.avatar.url
    else
      '/images/default-avatar.png'
    end
  end
  def complete_profile_helper
    if current_user.avatar.blank? || current_user.shop.blank?
      'プロフィールを完成するには『プロフィール編集』'
    end
  end
end
