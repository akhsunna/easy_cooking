class DishesController < ApplicationController
  include Rails::Pagination
  PER_PAGE = 15

  def index
    dishes = Dish.all

    filtering_params(params).each do |key, value|
      dishes = dishes.public_send(key, value) if value.present?
    end

    if params[:order_by].blank?
      dishes = dishes.order_by_name
    end

    dc = dishes.count

    if params[:page].present?
      current_page = params[:page].to_i
      dishes = paginate dishes, per_page: PER_PAGE
      next_page = current_page * PER_PAGE >= dc ? current_page : current_page + 1
    end

    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(
        dishes,
        each_serializer: DishSerializer
      ),
      next_page: next_page
    }
  end

  def show
    dish = Dish.find(params[:id])
    render json: DishSerializer.new(dish).to_json
  end

  private

  def filtering_params(params)
    params.slice(
      :order_by,
      :by_category,
      :by_ingredients,
      :by_name
    )
  end
end
