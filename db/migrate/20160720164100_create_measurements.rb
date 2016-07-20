class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table(:measurements) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
      t.column(:measurement, :float)
      t.column(:unit, :varchar)
    end
  end
end
