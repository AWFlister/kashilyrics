class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :duration
      t.string :composer
      t.date :release_date

      t.timestamps
    end
  end
end
