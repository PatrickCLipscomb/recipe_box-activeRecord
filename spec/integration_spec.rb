require('spec_helper')

describe('add recipe', {:type => :feature}) do
  it "add recipe" do
    test_ingredient1 = Ingredient.create({name: 'salt'})
    test_category1 = Category.create({name: 'spice'})
    visit('/')
    check('ingredient_ids[]')
    check('category_ids[]')
    fill_in('new_recipe_name', :with => 'recipe')
    click_button('Add Recipe')
    expect(page).to have_content('salt')
  end
end
