class CreateMusiucs < ActiveRecord::Migration[5.2]
  def change
    create_table :musiucs do |t|
      t.integer :cd_id, null: false
      t.integer :track_num, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
