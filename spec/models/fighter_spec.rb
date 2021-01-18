require 'rails_helper'

RSpec.describe Fighter, type: :model do
  let(:fighter) { Fighter.new(name: 'any', health: 100, attack: 20) }

  it 'is valid with valid attributes' do
    expect(fighter).to be_valid
  end

  it 'is not valid without name' do
    fighter.name = nil
    expect(fighter).not_to be_valid
  end

  it 'is not valid without heath' do
    fighter.health = nil
    expect(fighter).not_to be_valid
  end

  it 'health must be between 50 and 100' do
    fighter.health = 30
    expect(fighter).not_to be_valid

    fighter.health = 120
    expect(fighter).not_to be_valid
  end

  it 'is not valid without attack' do
    fighter.attack = nil
    expect(fighter).not_to be_valid
  end

  it 'attack must be between 0 and 50' do
    fighter.attack = 60
    expect(fighter).not_to be_valid
  end

  it 'is survivor if health > 0' do
    expect(fighter.is_survivor).to be true
  end

  it 'is dead if health is 0' do
    fighter.health = 0
    expect(fighter.is_survivor).to be false
  end
end
