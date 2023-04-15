class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :biography
      t.string :country
      t.string :url

      t.timestamps
    end
  end
end
