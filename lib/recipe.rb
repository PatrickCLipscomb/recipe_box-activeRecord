class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :ingredients, through: :measurements
  has_many :measurements
  validates_numericality_of(:rating, :greater_than => 0, :less_than => 11, :on => :update)
end
