require "rails_helper"

RSpec.describe ExpenseController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/expense").to route_to("expense#index")
    end

    it "routes to #new" do
      expect(get: "/expense/new").to route_to("expense#new")
    end

    it "routes to #show" do
      expect(get: "/expense/1").to route_to("expense#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/expense/1/edit").to route_to("expense#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/expense").to route_to("expense#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/expense/1").to route_to("expense#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/expense/1").to route_to("expense#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/expense/1").to route_to("expense#destroy", id: "1")
    end
  end
end
