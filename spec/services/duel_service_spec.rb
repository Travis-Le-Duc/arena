require 'rails_helper'
require_relative '../../app/services/duel_service'
require_relative '../../app/models/fighter'

RSpec.describe DuelService do
  let(:fighter1) { Fighter.new(name: 'Rambo', health: 80, attack: 30) }
  let(:fighter2) { Fighter.new(name: 'Terminator', health: 100, attack: 10) }
  let(:equipment1) { Equipment.new(name: 'shield', force: 0, protection: 10) }
  let(:equipment2) { Equipment.new(name: 'knife', force: 5, protection: 0) }
  let(:equipment3) { Equipment.new(name: 'iron fist', force: 5, protection: 0) }
  let(:duel_service) { DuelService.new(fighter1, fighter2, [equipment1, equipment2, equipment3]) }

  describe '#execute' do
    it 'returns duel with a winner and logs' do
      duel = duel_service.execute

      expect(duel.fighter1).to eql(fighter1)
      expect(duel.fighter2).to eql(fighter2)
      expect(duel.winner).to eql(fighter1)

      logs = [
        '=============================================================',
        "#{fighter1.name} with health: 80, attack: 30",
        '==============================VS=============================',
        "#{fighter2.name} with health: 100, attack: 10",
        '=============================================================',
        'Equipments: shield, knife, iron fist',
        '=============================================================',
        'Rambo(80) attacks Terminator(70)',
        'Terminator(70) attacks Rambo(70)',
        'Rambo(70) attacks Terminator(40)',
        'Terminator(40) attacks Rambo(60)',
        'Rambo(60) attacks Terminator(10)',
        'Terminator(10) attacks Rambo(50)',
        'Rambo(50) attacks Terminator(0)'
      ]
      expect(duel.logs).to eql(logs)
    end
  end
end
