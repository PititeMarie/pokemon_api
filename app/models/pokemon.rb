class Pokemon < ApplicationRecord
  # Constants
  TYPES = [ "Grass", "Fire", "Water", "Bug", "Normal", "Poison", "Electric", "Ground", "Fairy", "Fighting", "Psychic", "Rock", "Ghost", "Ice", "Dragon", "Dark", "Steel", "Flying"]

  before_save :calculate_total

  # Validations
  validates :name, :type1, presence: { message: "must be given please" }, allow_blank: false
  validates :type1, inclusion: { in: TYPES, message: "must be in available types (" + TYPES.join(", ") + ")" }
  validates :type2, inclusion: { in: TYPES, message: "must be in available types (" + TYPES.join(", ") + ")" }, allow_blank: true
  validate :types_are_different 
  validates :number, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation,
    presence:      { message: "must be given please" },
    numericality:  { only_integer: true, greater_than: 0 }

  # Validation methods
  def types_are_different
    if self.type1 == self.type2
      errors.add(:type2, "can't be the same as type1")
    end
  end

  def self.permitted_params
    [:number, :name, :type1, :type2, :hp, :attack, :defense, :special_attack, :special_defense, :speed, :generation, :legendary]
  end

  private
  def calculate_total 
    self.total = [self.hp, self.attack, self.defense, self.special_attack, self.special_defense, self.speed ].sum
  end
end
