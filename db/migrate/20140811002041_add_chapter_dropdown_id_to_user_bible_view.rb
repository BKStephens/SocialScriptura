class AddChapterDropdownIdToUserBibleView < ActiveRecord::Migration
  def change
    add_column :user_bible_views, :chapter_dropdown_id, :integer
  end
end
