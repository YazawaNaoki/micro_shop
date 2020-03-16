class AddLabelIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :label_id, :integer
  end
end
