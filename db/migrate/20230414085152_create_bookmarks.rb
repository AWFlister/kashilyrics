class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :bookmarkable_id
      t.string :bookmarkable_type

      t.timestamps
    end
  end
end
