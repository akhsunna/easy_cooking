class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.text :instructions, null: false
      t.attachment :image
      t.integer :cooking_time
      t.integer :calories
      t.integer :difficulty_level, default: 1
    end
  end
end
