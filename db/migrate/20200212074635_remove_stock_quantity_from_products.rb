class RemoveStockQuantityFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :stock_quantity, :integer
  end
end
