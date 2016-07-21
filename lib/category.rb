class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  before_save(:downcase_name)

private

  define_method(:downcase_name) do
    self.name = self.name.downcase
  end
end
