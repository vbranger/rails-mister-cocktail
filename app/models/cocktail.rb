class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :glass_type, presence: true

  has_many :units, through: :doses
  has_many :ingredients, through: :doses
end
