
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
result = JSON.parse(json)

puts 'deleting all ingredient'
Ingredient.delete_all


puts 'loading seed'

result["drinks"].each do |ingredient|
  ingredient = Ingredient.create(name: ingredient["strIngredient1"])
  puts ingredient.name
end

puts 'seed completed'
