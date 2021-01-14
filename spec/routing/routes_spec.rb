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
			action:			"show",
			id:					"2"
		)
	end

	it "routes /fighters/new to the new action" do
		expect(get("/fighters/new")).to route_to("fighters#new")
	end

	it "routes /fighters to the create action" do
		expect(post("/fighters")).to route_to("fighters#create")
	end

	it "routes /fighters/:id/edit to the edit action" do
		expect(get("/fighters/4/edit")).to route_to(
			controller:	 "fighters",
			action:			 "edit",
			id:					 "4"
		)
	end

	it "routes /fighters/:id to the update action" do
		expect(put("/fighters/6")).to route_to(
			controller:	 "fighters",
			action:			 "update",
			id:					 "6"
		)
	end

	it "routes /fighters/:id to the destroy action" do
		expect(delete("/fighters/3")).to route_to(
			controller:	 "fighters",
			action:			 "destroy",
			id:					 "3"
		)
	end
end
