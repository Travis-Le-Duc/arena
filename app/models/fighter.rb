class Fighter < ApplicationRecord
	validates :name, presence: true
	validates :health, presence: true
	validates :attack, presence: true

	def is_dead
		self.health == 0
	end
end
