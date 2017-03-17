class Dish < ApplicationRecord
  has_many :dish_ingredients
  has_and_belongs_to_many :categories

  has_attached_file :image,
                    styles: {
                        medium: '300x300>',
                        thumb: '100x100>'
                    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # scope :by_category, -> (category_ids) {
  #   includes(:categories)
  #     .where(categories: { id: category_ids })
  # }
  # scope :sort_by, -> (column) {order(column)}
end
