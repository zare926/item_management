class AddIconimageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :iconimage, :text
  end
end
