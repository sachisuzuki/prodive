# frozen_string_literal: true

class Condition < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :divepoint, :status, presence: true
  belongs_to :user
  belongs_to :divesite

  enum status: { open: 0, warning: 1, close: 2 }
end
