# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

# CREATE INGREDIENTS FROM DISTANT JSON
# url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
# serialized_ingredients = open(url).read
# ingredients = JSON.parse(serialized_ingredients)

# p ingredients

p "Seeding"

p "clean DB"

Cocktail.destroy_all
Unit.destroy_all
Ingredient.destroy_all

p Cocktail.all
p Unit.all
p Ingredient.all

# CREATE INGREDIENTS FROM LOCAL JSON (with colors)
filepath = 'db/ingredients.json'
serialized_ingredients = File.read(filepath)
ingredients = JSON.parse(serialized_ingredients)


puts 'creating ingredients'
ingredients["drinks"].each do |ingredient|
  new_ingredient = Ingredient.new(
    name: ingredient["strIngredient1"],
    color: ingredient["color"]
  )
  new_ingredient.save!
end
puts 'ingredients created'


# CREATE AMERICAN UNITS
puts 'creating units'
# all value are in ounce
Unit.create!(name: 'ounce', value: '1')
Unit.create!(name: 'dash', value: '0.03125')
Unit.create!(name: 'tablespoon', value: '0.5')
Unit.create!(name: 'splash', value: '0.2')
Unit.create!(name: 'teaspoon', value: '0.1666')
Unit.create!(name: 'pony', value: '1')
Unit.create!(name: 'jigger', value: '1.5')
Unit.create!(name: 'shot', value: '1.5')
Unit.create!(name: 'snit', value: '3')
Unit.create!(name: 'wineglass', value: '4')
Unit.create!(name: 'split', value: '6')
Unit.create!(name: 'cup', value: '8')
Unit.create!(name: 'pint', value: '16')
Unit.create!(name: 'fifth', value: '25.6')
Unit.create!(name: 'quart', value: '32')
Unit.create!(name: 'gallon', value: '128')

puts 'all units created'