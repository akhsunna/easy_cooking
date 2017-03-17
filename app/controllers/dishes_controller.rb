class DishesController < ApplicationController
  def index
    dishes = Dish.all
    dishes_count = dishes.count

    render json: {
      dishes: ActiveModel::Serializer::CollectionSerializer.new(
        dishes,
        each_serializer: DishSerializer
      ),
      count: dishes_count
    }
  end
end
