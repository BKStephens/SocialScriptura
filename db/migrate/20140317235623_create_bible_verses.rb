class CreateBibleVerses < ActiveRecord::Migration
  def change
    create_table :bible_verses do |t|
      t.references :bible_chapters, index: true
      t.integer :bible_verse

      t.timestamps
    end
  end
end
