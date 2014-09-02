class AddBibleVersions < ActiveRecord::Migration
  def up
    BibleVersion.create!({:name => 'Amplified Bible', :abbreviation => 'AMP'})
    BibleVersion.create!({:name => 'Contemporary English Version', :abbreviation => 'CEVD'})
    BibleVersion.create!({:name => 'English Standard Version', :abbreviation => 'ESV'})
    BibleVersion.create!({:name => 'Good News Translation', :abbreviation => 'GNTD'})
    BibleVersion.create!({:name => 'King James Version', :abbreviation => 'KJVA'})
    BibleVersion.create!({:name => 'The Message', :abbreviation => 'MSG' })
    BibleVersion.create!({:name => 'New American Standard Bible', :abbreviation => 'NASB'})
  end

  def down
    BibleVersion.find_by(name: 'Amplified Bible').delete
    BibleVersion.find_by(name: 'Contemporary English Version').delete
    BibleVersion.find_by(name: 'English Standard Version').delete
    BibleVersion.find_by(name: 'Good News Translation').delete
    BibleVersion.find_by(abbreviation: 'KJVA').delete
    BibleVersion.find_by(name: 'The Message').delete
    BibleVersion.find_by(name: 'New American Standard Bible').delete
  end
end
