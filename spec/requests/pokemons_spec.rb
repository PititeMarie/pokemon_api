require 'rails_helper'

RSpec.describe PokemonsController do
  describe "GET #index" do
    before do
      get :index
    end
    context "with valid or no attributes" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it "returns the 20 first pokemons" do

      end
      it "return the specified amount of pokemon" do

      end
      it "returns the pokemon of the specified page" do

      end
    end
    context "with invalid attributes" do
      it "does not save it to the database" do

      end
      it "returns errors" do
        
      end
    end
  end

  describe "GET #show" do
    before do
      get :show, id: 1
    end
    it "returns it when the id exist" do
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(hash_body.keys).to match_array([:id, :name, :number, :name, :type1, :type2, :total, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation, :legendary])
    end
    it "returns errors when the id does not exist" do
        
    end
  end

  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "returns http success" do
  #       expect(response).to have_http_status(:success)
  #     end
  #     it "saves it to the database" do

  #     end
  #     it "returns it" do
        
  #     end
  #   end
  #   context "with invalid attributes" do
  #     it "does not save it to the database" do

  #     end
  #     it "returns errors" do
        
  #     end
  #   end
  # end

  # describe "PUT/PATCH #update" do
  #   context "with valid attributes" do
  #     it "returns http success" do
  #       expect(response).to have_http_status(:success)
  #     end
  #     it "updates it in the database" do

  #     end
  #     it "returns it" do
        
  #     end
  #   end
  #   context "with invalid attributes" do
  #     it "does not update it in the database" do

  #     end
  #     it "returns errors" do
        
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  #   it "delete it from database and should not exist after action" do

  #   end
  # end
end