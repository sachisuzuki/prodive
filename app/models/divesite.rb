class Divesite < ApplicationRecord
  validates :area, :zone, :name, :latitude, :longitude, presence: true
  has_many :conditions, dependent: :destroy

  require './app/commonclass/area'
  enum area: Area.options_for_enum

  require './app/commonclass/zone'
  enum zone: Zone.options_for_enum

end
