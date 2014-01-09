class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.belongs_to :band

      t.timestamps
    end
    add_index :albums, :band_id
  end
end
