class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  
  has_many :ingredients, through: :doses
end
