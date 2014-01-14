class DropBibleViews < ActiveRecord::Migration
  def change
  	drop_table :bible_views
  end
end
