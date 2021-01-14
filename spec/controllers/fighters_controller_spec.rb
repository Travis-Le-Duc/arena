require 'rails_helper'

RSpec.describe FightersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success if fighter is found" do
			f = Fighter.new(name: "any", health: 100, attack: 20)
			f.save
      get :show, params: { id: f.id }
      expect(response).to have_http_status(:success)
    end

    it "renders error text if fighter not found" do
      get :show, params: { id: "24" }
      expect(response.body).to eq("Fighter not found")
    end
  end

  describe "GET #new" do
		it "render the new form" do
			get :new
		  expect(response).to render_template(:new)
		end
	end

  describe "POST #create" do
    it "successfully creates a new fighter and redirects to the created fighter" do
			expect {
				post :create, params: { fighter: { name: "any", health: 50, attack: 20} }
			}.to change(Fighter, :count).by(1)
		  expect(response).to redirect_to(Fighter.last)
    end

    it "failed creating and re-render the new form" do
			expect {
				post :create, params: { fighter: { name: "any", health: "", attack: ""} }
			}.to change(Fighter, :count).by(0)
		  expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
		it "render the new form" do
			f = Fighter.new(name: "any", health: 100, attack: 20)
			f.save
			get :edit, params: { id: f.id }
		  expect(response).to render_template(:new)
		end

	end

  describe "POST #update" do
    it "successfully update a fighter and redirects to the updated fighter" do
			f = Fighter.new(name: "any", health: 100, attack: 20)
			f.save

			post :update, params: { id: f.id, fighter: { name: "new_name", health: 50, attack: 20} }
		  expect(response).to redirect_to(f)
    end

    it "failed updating and re-render the new form" do
			f = Fighter.new(name: "any", health: 100, attack: 20)
			f.save

			post :update, params: { id: f.id, fighter: { name: "new_name", health: "", attack: 20} }
		  expect(response).to render_template(:new)
    end
	end

  describe "POST #destroy" do
			f = Fighter.new(name: "any", health: 100, attack: 20)
			f.save
    it "successfully delete a fighter and redirects to the list ighters" do
			expect {
				post :destroy, params: { id: f.id }
			}.to change(Fighter, :count).by(-1)
		  expect(response).to redirect_to(fighters_path)
		end

    it "failed deleting a fighter and redirects to the list ighters" do
			expect {
				post :destroy, params: { id: "32" }
			}.to change(Fighter, :count).by(0)
      expect(response.body).to eq("Fighter not found")
		end
	end
end