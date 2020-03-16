class RemoveBlockTwonFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :block_twon, :string
  end
end
