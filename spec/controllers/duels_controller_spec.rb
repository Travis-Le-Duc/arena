require 'rails_helper'

RSpec.describe DuelsController, type: :controller do
	let(:fighter1) { Fighter.create(name: "Water", health: 100, attack: 20) }
	let(:fighter2) { Fighter.create(name: "Fire", health: 100, attack: 20) }

  describe "GET /index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success if duel is found" do
			d = Duel.new(fighter1: fighter1, fighter2: fighter2, winner: fighter1)
			d.save
      get :show, params: { id: d.id }
      expect(response).to have_http_status(:success)
    end

    it "renders error text if duel not found" do
      get :show, params: { id: "54" }
      expect(response.body).to eq("Duel not found")
    end
  end

  describe "GET #new" do
		it "render the new form" do
			get :new
		  expect(response).to render_template(:new)
		end
	end

  describe "POST #create" do
    it "successfully creates a new duel and redirects to the created duel" do
			expect {
				post :create, params: { fighter1: { id: fighter1.id }, fighter2: { id: fighter2.id } }
			}.to change(Duel, :count).by(1)
		  expect(response).to redirect_to(Duel.last)
    end

    it "successfully creates duel_fighter_equipment for the two fighters" do
			equipment = Equipment.create(name: "Knif", force: 2, protection: 0)
			expect {
				post :create, params: { fighter1: { id: fighter1.id }, fighter2: { id: fighter2.id }, equipment_ids: ["1"] }
			}.to change(DuelEquipment, :count).by(1)
    end

    it "failed creating and re-render the new form if id1 and id2 are same" do
			expect {
				post :create, params: { fighter1: { id: fighter1.id }, fighter2: { id: fighter1.id } }
			}.to change(Duel, :count).by(0)
		  expect(response).to render_template(:new)
    end

    it "failed creating and re-render the new form if one of the ids is not found" do
			expect {
				post :create, params: { fighter1: { id: fighter1.id }, fighter2: { id: "32" } }
			}.to change(Duel, :count).by(0)
		  expect(response).to render_template(:new)
    end
  end
end
