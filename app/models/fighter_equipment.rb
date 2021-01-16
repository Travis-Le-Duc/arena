class FighterEquipment < ApplicationRecord
  belongs_to :fighter
  belongs_to :equipment
end
