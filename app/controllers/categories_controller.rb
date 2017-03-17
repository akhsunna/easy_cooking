class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: {
      dishes: ActiveModel::Serializer::CollectionSerializer.new(
        categories,
        each_serializer: CategorySerializer
      )
    }
  end
end
