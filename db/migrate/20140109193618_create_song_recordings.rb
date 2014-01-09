class CreateSongRecordings < ActiveRecord::Migration
  def change
    create_table :song_recordings do |t|
      t.string :name
      t.belongs_to :album

      t.timestamps
    end
    add_index :song_recordings, :album_id
  end
end
