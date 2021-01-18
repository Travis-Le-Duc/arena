class DuelEquipment < ApplicationRecord
  belongs_to :duel
  belongs_to :equipment
end
