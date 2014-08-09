class CreateUserBibleViews < ActiveRecord::Migration
  def change
    create_table :user_bible_views do |t|
      t.references :users, index: true
      t.string :bible_version
      t.string :book
      t.integer :chapter
      t.integer :verse_from
      t.integer :verse_to

      t.timestamps
    end
  end
end
