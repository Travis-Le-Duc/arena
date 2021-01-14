require 'rails_helper'

describe "root routing" do
	it "routes /fighters to the index action" do
		expect(get("/")).to route_to("pages#index")
	end
end

describe "routing for fighters" do
	it "routes /fighters to the index action" do
		expect(get("/fighters")).to route_to("fighters#index")
	end

	it "routes /fighters/:id to the show action" do
		expect(get("/fighters/2")).to route_to(
			controller: "fighters",
			action: "show",
			id: "2"
		)
	end

	it "routes /fighters/new to the new action" do
		expect(get("/fighters/new")).to route_to("fighters#new")
	end

	it "routes /fighters to the create action" do
		expect(post("/fighters")).to route_to("fighters#create")
	end
end
