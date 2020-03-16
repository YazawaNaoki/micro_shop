class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :pay_method, default: 0, null: false
      t.integer :order_status, default: 0, null: false
      t.integer :postage, default: 500, null: false
      t.integer :address_id, null: false
      t.integer :total_price, default: 0, null: false

      t.timestamps
    end
  end
end
