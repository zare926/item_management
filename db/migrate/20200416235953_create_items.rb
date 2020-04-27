class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :status, default: 0
      t.string :image, null: false
      t.integer :limit, default: 4320
      t.integer :weather
      t.string :text
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end