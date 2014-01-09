class CreateBandMemberships < ActiveRecord::Migration
  def change
    create_table :band_memberships do |t|
      t.belongs_to :musician
      t.belongs_to :band

      t.timestamps
    end
    add_index :band_memberships, :musician_id
    add_index :band_memberships, :band_id
  end
end
