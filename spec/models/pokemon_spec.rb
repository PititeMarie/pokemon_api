require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:pokemon) { Pokemon.first }

  describe "is valid" do
    it "with valid attributes" do
      expect(pokemon).to be_valid
    end
  end
  describe "is not valid" do
    it "without a name" do
      pokemon.name = nil
      expect(pokemon).to_not be_valid
    end

    it "without a first type" do
      pokemon.type1 = nil
      expect(pokemon).to_not be_valid
    end

    it "when both types are the same" do
      pokemon.type2 = pokemon.type1
      expect(pokemon).to_not be_valid
    end

    it "when type is not in the type list" do
      pokemon.type1 = "Test"
      expect(pokemon).to_not be_valid
    end
  end
end