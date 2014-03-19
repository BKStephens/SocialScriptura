class BibleView
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :bible_version, :book, :chapter, :verse_from, :verse_to

  def initialize(params = {})
    temp_chapter = BibleChapters.where(:id => params[:chapter]).select("chapters, bible_books_id").first
    
    unless temp_chapter.nil? then
      self.bible_version = params[:bible_version]
      self.book = BibleBooks.where(:id => temp_chapter[:bible_books_id]).select("book").first[:book]
      self.chapter = temp_chapter[:chapters]
      self.verse_from = params[:verse_from]
      self.verse_to = params[:verse_to]
    else
      bible_book = BibleBooks.where(:book => 'Genesis').select("id, book").first
      bible_chapter = BibleChapters.where(:chapters => '1', :bible_books_id => bible_book).select("id, chapters").first
      self.bible_version = 'asv.xml'
      self.book = bible_book[:book]
      self.chapter = bible_chapter[:chapters]
    end
  end

  def persisted?
    false
  end
end
