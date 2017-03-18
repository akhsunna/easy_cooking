class Category < ApplicationRecord
  has_and_belongs_to_many :dishes

  scope :order_by_name, -> {order(:name)}
end
