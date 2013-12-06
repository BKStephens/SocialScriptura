class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :bible_verse_start
      t.string :bible_verse_end
      t.text :description
      
      t.timestamps
    end
  end
end
