class BibleView #< ActiveRecord::Base
  include ActiveModel::Validations
  #are these two below necessary?
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :bible_version, :book, :chapter, :verse_from, :verse_to

  def initialize(bible_version = 'asv.xml', book = 'Genesis', chapter = 1, options = {})
    self.bible_version = bible_version
    self.book = book
    self.chapter = chapter
    self.verse_from = options[:verse_from]
    self.verse_to = options[:verse_to]
  end
end
