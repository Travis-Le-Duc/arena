require 'rails_helper'
require_relative '../../app/services/duel_service.rb'
require_relative '../../app/models/fighter.rb'

RSpec.describe DuelService do
	let(:fighter1) { Fighter.new(name: "Rambo", health: 80, attack: 30) }
	let(:fighter2) { Fighter.new(name: "Terminator", health: 100, attack: 20) }
	let(:duel_service) { DuelService.new(fighter1, fighter2) }

	describe '#execute' do
		it "returns duel with a winner, a loser and logs" do
			duel = duel_service.execute

			expect(duel.winner).to eql(fighter1)
			expect(duel.loser).to eql(fighter2)

			logs = [
				"Rambo:30-Terminator:70",
				"Terminator:20-Rambo:60",
				"Rambo:30-Terminator:40",
				"Terminator:20-Rambo:40",
				"Rambo:30-Terminator:10",
				"Terminator:20-Rambo:20",
				"Rambo:30-Terminator:0"
			]
			expect(duel.logs).to eql(logs)
		end
	end
end
