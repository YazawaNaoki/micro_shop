class DestroyMusiuc < ActiveRecord::Migration[5.2]
  def change
    drop_table :musiucs
  end
end
