require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipies = Recipe.all()
  @ingredients = Ingredient.all()
  erb(:index)
end

get('/add_items') do
  erb(:add_items)
end

post('/add_ingredient') do
  @ingredient = Ingredient.create({name: params['new_ingredient_name']})
  erb(:add_items)
end

post('/add_category') do
  @category = Category.create({name: params['new_category_name']})
  erb(:add_items)
end

post('/add_recipe') do
  recipe = Recipe.create({name: params['new_recipe_name']})
  ingredient_ids = params.fetch('ingredient_ids')
  ingredient_ids.each() do |ingredient_id|
    Ingredient.find(ingredient_id)
  erb(:recipe_page)
end
