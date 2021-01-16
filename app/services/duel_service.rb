class DuelService
	def initialize(fighter1, fighter2)
		@fighter1 = fighter1
		@fighter2 = fighter2
		@duel = Duel.new
	end

	def execute
		defendant = @fighter1
		attacker = @fighter2

		while no_dead
			attacker, defendant = defendant, attacker
			attack(attacker, defendant)
			log_attack(attacker, defendant)
		end

		@duel.winner = attacker
		@duel.loser = defendant
		@duel
	end

	private

	def attack(attacker, defendant)
		defendant.health -= attacker.attack
	end

	def log_attack(attacker, defendant)
		@duel.logs << "#{attacker.name}:#{attacker.attack}-#{defendant.name}:#{defendant.health.negative? ? 0 : defendant.health}"
	end

	def no_dead
		@fighter1.is_survivor && @fighter2.is_survivor
	end
end
