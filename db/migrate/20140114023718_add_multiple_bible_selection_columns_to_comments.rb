class AddMultipleBibleSelectionColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :book_start, :text
    add_column :comments, :chapter_start, :text
    add_column :comments, :verse_start, :text
    add_column :comments, :chapter_end, :text
    add_column :comments, :verse_end, :text
  end
end
