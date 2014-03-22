class BibleVerse < ActiveRecord::Base
  belongs_to :bible_chapters

  def self.default_verses
    bible_book = BibleBooks.where(:book => 'Genesis').select("id, book").first
    bible_chapter = BibleChapters.where(:chapters => '1', :bible_books_id => bible_book).select("id, chapters").first
    bible_verses = BibleVerse.where(:bible_chapters_id => bible_chapter).select("bible_verse").order("bible_verse asc").all  
  end

  def self.load_verses(book_param)
    bible_book = BibleBooks.where(:book => book_param).select("id, book").first
    bible_chapter = BibleChapters.where(:chapters => '1', :bible_books_id => bible_book).select("id, chapters").first
    bible_verses = BibleVerse.where(:bible_chapters_id => bible_chapter).select("bible_verse").order("bible_verse asc").all  
  end
end
