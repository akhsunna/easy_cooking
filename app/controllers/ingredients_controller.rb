class IngredientsController < ApplicationController
  include Rails::Pagination
  PER_PAGE = 25

  def index
    ingredients = Ingredient.all

    if params[:page].present?
      current_page = params[:page].to_i
      ingredients = paginate ingredients, per_page: PER_PAGE
      next_page = current_page * PER_PAGE >= ingredients.count ? current_page : current_page + 1
    end

    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(
        ingredients,
        each_serializer: IngredientSerializer
      ),
      next_page: next_page
    }
  end
end
