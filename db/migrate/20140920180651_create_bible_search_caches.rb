class CreateBibleSearchCaches < ActiveRecord::Migration
  def change
    create_table :bible_search_caches do |t|
      t.string :bible_version
      t.string :bible_book_abbreviation
      t.integer :chapter
      t.integer :verse
      t.text :content
      t.string :copyright

      t.timestamps
    end
  end
end
