class CategoriesController < ApplicationController
  def index
    categories = Category.order_by_name
    render json: {
      dishes: ActiveModel::Serializer::CollectionSerializer.new(
        categories,
        each_serializer: CategorySerializer
      )
    }
  end
end
