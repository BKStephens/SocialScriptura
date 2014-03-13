class BibleVersion < ActiveRecord::Base
  belongs_to :user
  has_many :bible_books
end
