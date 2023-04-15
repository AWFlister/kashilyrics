class ChangeTableBookmarks < ActiveRecord::Migration[7.0]
  def change
    change_table :bookmarks do |t|
      t.remove :bookmarkable_id, :bookmarkable_type
    end

    add_reference :bookmarks, :bookmarkable, polymorphic: true
  end
end
