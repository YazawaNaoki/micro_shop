class CreateCds < ActiveRecord::Migration[5.2]
  def change
    create_table :cds do |t|
      t.integer :cd_num, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
  end
end
