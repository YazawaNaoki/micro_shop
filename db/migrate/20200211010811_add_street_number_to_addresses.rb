class AddStreetNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :street_number, :string
  end
end
