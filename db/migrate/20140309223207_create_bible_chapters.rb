class CreateBibleChapters < ActiveRecord::Migration
  def change
    create_table :bible_chapters do |t|
      t.string :chapters

      t.timestamps
    end
  end
end
