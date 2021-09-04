class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :conditions
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i(google)

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
end
