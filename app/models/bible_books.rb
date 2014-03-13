class BibleBooks < ActiveRecord::Base
  has_many :bible_chapters, :class_name => "BibleChapters"
  
end
