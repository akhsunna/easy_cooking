class DishIngredientSerializer < BaseSerializer
  attributes :id, :name, :quantity, :unit

  def id
    object.ingredient.id
  end

  def name
    object.ingredient.name
  end
end