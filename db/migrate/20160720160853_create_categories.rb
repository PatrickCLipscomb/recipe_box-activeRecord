class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:name, :varchar)
    end
  end
end
