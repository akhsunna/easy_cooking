class AddIconToCategories < ActiveRecord::Migration[5.0]
  def change
    add_attachment :categories, :icon
  end
end
