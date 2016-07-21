class Ingredient < ActiveRecord::Base
  has_many :recipes, through: :measurements
  has_many :measurements
  before_save(:downcase_name)

  private

    define_method(:downcase_name) do
      self.name = name.downcase
    end

end
