require("spec_helper")

describe(Recipe) do
  it "validated the amount of the rating property" do
    recipe = Recipe.create({:name => 'test'})
    expect(recipe.update({:rating => 4})).to(eq(true))
  end
end
