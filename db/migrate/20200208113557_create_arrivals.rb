class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :product_id, null: false
      t.integer :count, null: false
      t.date :arrival_date, null: false

      t.timestamps
    end
  end
end
