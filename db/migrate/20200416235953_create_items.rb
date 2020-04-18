class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :status
      t.string :image
      t.integer :limit
      t.integer :weather
      t.string :text
      t.timestamps
    end
  end
end