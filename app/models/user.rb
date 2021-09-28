class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :conditions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  validates :name, presence: true, length: { maximum: 30 }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google)

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(name:     auth.info.name,
                      email:    auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                      )
    end
    user.save
    user
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
      user.uid = SecureRandom.uuid.tr('-', '')
    end
  end
  def self.guest_admin
    find_or_create_by!(email: 'guest.admin@example.com') do |user|
      user.name = 'ゲスト(管理者)'
      user.password = SecureRandom.urlsafe_base64
      user.uid = SecureRandom.uuid.tr('-', '')
      user.admin = true
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def follow(user)
    follower.create!(followed_id: user.id)
  end
  def unfollow(user)
    follower.find_by(followed_id: user.id).destroy
  end
  def following?(user)
    follower.find_by(followed_id: user.id)
  end
end
