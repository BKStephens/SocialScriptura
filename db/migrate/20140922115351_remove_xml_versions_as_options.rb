class RemoveXmlVersionsAsOptions < ActiveRecord::Migration
  def self.up
    BibleVersion.connection.execute("delete from bible_versions where file_name IN('asv.xml','akjv.xml','kjv.xml')")
  end

  def self.down
    BibleVersion.connection.execute("insert into bible_versions(name, abbreviation, file_name) values ('American Standard Version','ASV','asv.xml'),('American King James Version','AKJV','akjv.xml'),('King James Version','KJV','kjv.xml')")
  end
end
