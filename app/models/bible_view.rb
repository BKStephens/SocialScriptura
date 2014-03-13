class BibleView
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :bible_version, :book, :chapter, :verse_from, :verse_to

  def initialize(params = {})
    temp_chapter = BibleChapters.where(:id => params[:chapter]).select("chapters, bible_books_id").first
    temp_book = BibleBooks.where(:id => temp_chapter[:bible_books_id]).select("book").first

    self.bible_version = params[:bible_version] || 'kjv.xml'
    self.book = temp_book[:book]
    self.chapter = temp_chapter[:chapters]
    self.verse_from = params[:verse_from]
    self.verse_to = params[:verse_to]
  end

  def persisted?
    false
  end
end
