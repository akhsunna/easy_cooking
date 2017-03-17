class DishIngredientSerializer < BaseSerializer
  attributes :id, :name, :quantity, :unit

  def name
    object.ingredient.name
  end
end