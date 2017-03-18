class Ingredient < ApplicationRecord
  has_many :dish_ingredients

  scope :by_name, -> (value) { where('ingredients.name ILIKE ?', "%#{value}%") }
  scope :order_by_name, -> {order(:name)}
end
