class UpdateExistingCommentsToHaveABibleVersion < ActiveRecord::Migration
  def self.up 
    Comment.connection.execute("update comments set bible_version='ESV'")
  end

  def self.down
    Comment.connection.execute("update comments set bible_version=''")
  end
end
