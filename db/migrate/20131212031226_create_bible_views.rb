class CreateBibleViews < ActiveRecord::Migration
  def change
    create_table :bible_views do |t|
      t.string :bible_version
      t.string :book
      t.integer :chapter
      t.integer :verse_from
      t.integer :verse_to

      t.timestamps
    end
  end
end
