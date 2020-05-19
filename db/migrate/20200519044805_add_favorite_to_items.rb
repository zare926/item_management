class AddFavoriteToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :favorite, :integer, default: 0
  end
end
