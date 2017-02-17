require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

pinacolada = Cocktail.create!(name: 'Pinacolada')
mojito = Cocktail.create!(name: 'Mojito')

filepath = open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
doc = filepath.read
json = JSON.parse(doc)

descriptions = ['3cl', '10gr', '5 leaves', '5cl', '2 leaves']

json['drinks'].each do |ingredient|
  Ingredient.create! name: ingredient["strIngredient1"]
end


4.times do
  pinacolada.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
  mojito.doses.create(description: descriptions.sample, ingredient: Ingredient.all.sample) #cocktail_id is already added
end
