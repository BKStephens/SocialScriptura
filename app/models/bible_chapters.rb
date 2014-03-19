class BibleChapters < ActiveRecord::Base
  belongs_to :bible_books

  def self.for_select
    BibleBooks.all.map do |book|
      [book.book, book.bible_chapters.order("chapters asc").map { |c| [c.chapters, c.id] }]      
    end
  end
end
