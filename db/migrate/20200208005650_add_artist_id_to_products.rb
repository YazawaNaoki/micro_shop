class AddArtistIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :artist_id, :integer
  end
end
