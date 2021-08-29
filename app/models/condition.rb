class Condition < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum status: { open: 0, warning: 1, close: 2 }

end
