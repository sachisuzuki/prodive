class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true, length: { maximum: 30 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
