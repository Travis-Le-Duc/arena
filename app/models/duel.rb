class Duel < ApplicationRecord
  belongs_to :fighter1, class_name: 'Fighter'
  belongs_to :fighter2, class_name: 'Fighter'
  belongs_to :winner, class_name: 'Fighter'
  has_many :duel_equipments
  has_many :equipments, through: :duel_equipments
  serialize :logs, Array
end
