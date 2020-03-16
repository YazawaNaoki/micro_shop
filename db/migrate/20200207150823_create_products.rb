class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :image_id, null: false
      t.string :album_name, null: false
      t.date :sell_at, null: false
      t.integer :price, null: false
      t.boolean :is_deleted, null: false, default: false
      t.integer :stock_quantity, null: false, default: 0
      t.integer :product_status, null: false, default: 0

      t.timestamps
    end
  end
end
