class DishesController < ApplicationController
  include Rails::Pagination
  PER_PAGE = 15

  def index
    dishes = Dish.all

    if params[:page].present?
      current_page = params[:page].to_i
      dishes = paginate dishes, per_page: PER_PAGE
      next_page = current_page * PER_PAGE >= dishes.count ? current_page : current_page + 1
    end

    render json: {
      dishes: ActiveModel::Serializer::CollectionSerializer.new(
        dishes,
        each_serializer: DishSerializer
      ),
      next_page: next_page
    }
  end
end
