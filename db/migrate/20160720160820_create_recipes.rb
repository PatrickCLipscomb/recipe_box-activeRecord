class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :varchar)
      t.column(:instructions, :varchar)
      t.column(:rating, :float)

      t.timestamps
    end
  end
end
