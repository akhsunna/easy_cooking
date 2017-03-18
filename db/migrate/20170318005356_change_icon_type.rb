class ChangeIconType < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :categories, :icon
    add_column :categories, :icon_name, :string, default: 'sb-bistro-appetizer'
  end
end
