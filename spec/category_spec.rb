require('spec_helper')

describe(Category) do
  it "downcases the name of a saved category" do
    category = Category.create({:name => "Plants"})
    expect(category.name()).to(eq("plants"))
  end
end
