class CreateJoinTableDishesCategories < ActiveRecord::Migration[5.0]
  def change
    create_join_table :dishes, :categories do |t|
      t.index [:dish_id, :category_id], unique: true, name: 'dish_category'
    end
  end
end
