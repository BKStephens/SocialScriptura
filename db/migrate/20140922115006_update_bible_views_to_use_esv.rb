class UpdateBibleViewsToUseEsv < ActiveRecord::Migration
  def self.up 
    UserBibleView.connection.execute("update user_bible_views set bible_version='ESV'")
  end

  def self.down
    UserBibleView.connection.execute("update user_bible_views set bible_version='asv.xml'")
  end
end
