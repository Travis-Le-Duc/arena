class Fighter < ApplicationRecord
	has_many :fighter_equipments
	has_many :equipments, :through => :fighter_equipments

	validates :name, presence: true
	validates :health, presence: true, inclusion: { in: 50..100 }
	validates :attack, presence: true, inclusion: { in: 0..50 }

	def is_survivor
		self.health > 0
	end
end
