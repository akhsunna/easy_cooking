class DishSerializer < BaseSerializer
  attributes :id, :name,
             :instructions, :difficulty_level,
             :cooking_time, :calories,
             :image_url, :ingredients

  def image_url
    root_url + object.image.url
  end

  def ingredients
    object.dish_ingredients.map do |di|
      DishIngredientSerializer.new(di)
    end
  end
end