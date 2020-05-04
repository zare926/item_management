class AddMysizeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mysize, :string
  end
end
