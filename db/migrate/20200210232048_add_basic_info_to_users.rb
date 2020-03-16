class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :given_name, :string
    add_column :users, :last_name_furigana, :string
    add_column :users, :given_name_furigana, :string
    add_column :users, :phone_number, :string
    add_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
