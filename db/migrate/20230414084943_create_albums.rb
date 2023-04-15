class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :album_type
      t.date :release_date
      t.string :label

      t.timestamps
    end
  end
end
