class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  belongs_to :unit

  validates :quantity, presence: true
  validates_uniqueness_of :ingredient_id, :scope => [:cocktail_id, :unit_id]
end
