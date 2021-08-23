class Divesite < ApplicationRecord

  require './app/commonclass/area'
  enum area: Area.options_for_enum

  require './app/commonclass/zone'
  enum zone: Zone.options_for_enum

end
