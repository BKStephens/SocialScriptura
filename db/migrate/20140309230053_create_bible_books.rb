class CreateBibleBooks < ActiveRecord::Migration
  def change
    create_table :bible_books do |t|
      t.string :book

      t.timestamps
    end

    execute 'ALTER TABLE bible_chapters ALTER COLUMN chapters TYPE integer USING (chapters::integer)'
    add_reference :bible_chapters, :bible_books, index: true
  end
end
