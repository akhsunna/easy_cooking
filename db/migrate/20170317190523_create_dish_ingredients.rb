class CreateDishIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :dish_ingredients do |t|
      t.belongs_to :dish, foreign_key: true, index: true
      t.belongs_to :ingredient, foreign_key: true, index: true
      t.float :quantity, null: false, default: 1
      t.string :unit
    end
  end
end
