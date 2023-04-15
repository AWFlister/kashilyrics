class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :lang_code
      t.string :lang_name

      t.timestamps
    end
  end
end
