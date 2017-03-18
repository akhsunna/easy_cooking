class Ingredient < ApplicationRecord
  has_many :dish_ingredients

  scope :order_by_name, -> {order(:name)}
end
