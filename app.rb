require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipies = Recipe.all()
  @ingredients = Ingredient.all()
  @categories = Category.all()
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
  @recipe = Recipe.create({name: params['new_recipe_name']})
  category_ids = params.fetch('category_ids')
  ingredient_ids = params.fetch('ingredient_ids')
  category_ids.each() do |category_id|
    category_obj = Category.find(category_id)
    @recipe.categories.push(category_obj)
  end
  @measurements = []
  ingredient_ids.each() do |ingredient_id|
    @measurements << Measurement.create({recipe_id: @recipe.id, ingredient_id: ingredient_id, measurement: params[ingredient_id + '_quantity'], unit: params[ingredient_id + '_unit']})
  end
  erb(:recipe_page)
end

patch('/add_instructions_to_recipe') do
  @recipe_created = Recipe.find(params.fetch('recipe_id').to_i())
  @recipe_created.update({:instructions => params.fetch('recipe_instructions')})
  erb(:recipe_page)
end

get('/recipe/:id') do
  @recipe_created = Recipe.find(params.fetch('id').to_i())
  erb(:recipe_page)
end

delete('/delete_recipe') do
  recipe = Recipe.find(params.fetch('recipe_id_delete').to_i())
  recipe.destroy
  redirect('/')
end
