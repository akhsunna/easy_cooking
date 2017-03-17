class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    ingredients_count = ingredients.count

    render json: {
        dishes: ActiveModel::Serializer::CollectionSerializer.new(
            ingredients,
            each_serializer: IngredientSerializer
        ),
        count: ingredients_count
    }
  end
end
