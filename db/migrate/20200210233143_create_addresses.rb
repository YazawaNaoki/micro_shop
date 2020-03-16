class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.string :city, null: false
      t.integer :user_id
      t.string :block_twon, null: false
      t.string :building, null: false
      t.string :last_name, null: false
      t.string :given_name, null: false
      t.string :last_name_furigana, null: false
      t.string :given_name_furigana, null: false
      t.integer :prefecture, null: false

      t.timestamps
    end
  end
end
