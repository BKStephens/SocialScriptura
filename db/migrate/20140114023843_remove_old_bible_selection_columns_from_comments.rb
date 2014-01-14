class RemoveOldBibleSelectionColumnsFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :bible_verse_start, :text
    remove_column :comments, :bible_verse_end, :text
  end
end
