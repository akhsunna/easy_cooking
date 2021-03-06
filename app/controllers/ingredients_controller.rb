class IngredientsController < ApplicationController
  include Rails::Pagination
  PER_PAGE = 25

  def index
    ingredients = Ingredient.order_by_name

    filtering_params(params).each do |key, value|
      ingredients = ingredients.public_send(key, value) if value.present?
    end

    di = ingredients.count

    if params[:page].present?
      current_page = params[:page].to_i
      ingredients = paginate ingredients, per_page: PER_PAGE
      next_page = current_page * PER_PAGE >= di ? current_page : current_page + 1
    end

    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(
        ingredients,
        each_serializer: IngredientSerializer
      ),
      next_page: next_page
    }
  end

  private

  def filtering_params(params)
    params.slice(:by_name)
  end
end
