require 'rails_helper'

RSpec.describe Fighter, type: :model do
	let(:fighter) { Fighter.new(name: "any", health: 100, attack: 20) }

	it "is valid with valid attributes" do
		expect(fighter).to be_valid
	end

	it "is not valid without name" do
		fighter.name = nil
		expect(fighter).to_not be_valid
	end

	it "is not valid without heath" do
		fighter.health = nil
		expect(fighter).to_not be_valid
	end

	it "is not valid without attack" do
		fighter.attack = nil
		expect(fighter).to_not be_valid
	end

	it "is not dead if health > 0" do
		expect(fighter.is_dead).to be false
	end

	it "is dead if health is 0" do
		fighter.health = 0
		expect(fighter.is_dead).to be true
	end
end
