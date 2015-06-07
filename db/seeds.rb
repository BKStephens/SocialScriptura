require 'open-uri'
require 'libxml'

books_list = ['Genesis','Exodus','Leviticus','Numbers','Deuteronomy','Joshua','Judges','Ruth',
	'1 Samuel','2 Samuel','1 Kings','2 Kings','1 Chronicles','2 Chronicles','Ezra','Nehemiah',
	'Esther','Job','Psalm','Proverbs','Ecclesiastes','Song of Solomon','Isaiah','Jeremiah',
	'Lamentations','Ezekiel','Daniel','Hosea','Joel','Amos','Obadiah','Jonah','Micah','Nahum',
	'Habakkuk','Zephaniah','Haggai','Zechariah','Malachi','Matthew','Mark','Luke','John','Acts',
	'Romans','1 Corinthians','2 Corinthians','Galatians','Ephesians','Philippians','Colossians',
	'1 Thessalonians','2 Thessalonians','1 Timothy','2 Timothy','Titus','Philemon','Hebrews','James',
	'1 Peter','2 Peter','1 John','2 John','3 John','Jude','Revelation']

books_list.each do |book|
  BibleBooks.create(book: book)
end

(1..50).each do |i|
  temp = BibleBooks.find_by book: 'Genesis'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..40).each do |i|
  temp = BibleBooks.find_by book: 'Exodus'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..27).each do |i|
  temp = BibleBooks.find_by book: 'Leviticus'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..36).each do |i|
  temp = BibleBooks.find_by book: 'Numbers'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..34).each do |i|
  temp = BibleBooks.find_by book: 'Deuteronomy'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..24).each do |i|
  temp = BibleBooks.find_by book: 'Joshua'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..21).each do |i|
  temp = BibleBooks.find_by book: 'Judges'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: 'Ruth'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..31).each do |i|
  temp = BibleBooks.find_by book: '1 Samuel'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..24).each do |i|
  temp = BibleBooks.find_by book: '2 Samuel'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..22).each do |i|
  temp = BibleBooks.find_by book: '1 Kings'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..25).each do |i|
  temp = BibleBooks.find_by book: '2 Kings'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..29).each do |i|
  temp = BibleBooks.find_by book: '1 Chronicles'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..36).each do |i|
  temp = BibleBooks.find_by book: '2 Chronicles'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..10).each do |i|
  temp = BibleBooks.find_by book: 'Ezra'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..13).each do |i|
  temp = BibleBooks.find_by book: 'Nehemiah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..10).each do |i|
  temp = BibleBooks.find_by book: 'Esther'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..42).each do |i|
  temp = BibleBooks.find_by book: 'Job'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..150).each do |i|
  temp = BibleBooks.find_by book: 'Psalm'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..31).each do |i|
  temp = BibleBooks.find_by book: 'Proverbs'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..12).each do |i|
  temp = BibleBooks.find_by book: 'Ecclesiastes'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..8).each do |i|
  temp = BibleBooks.find_by book: 'Song of Solomon'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..66).each do |i|
  temp = BibleBooks.find_by book: 'Isaiah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..52).each do |i|
  temp = BibleBooks.find_by book: 'Jeremiah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..5).each do |i|
  temp = BibleBooks.find_by book: 'Lamentations'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..48).each do |i|
  temp = BibleBooks.find_by book: 'Ezekiel'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..12).each do |i|
  temp = BibleBooks.find_by book: 'Daniel'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..14).each do |i|
  temp = BibleBooks.find_by book: 'Hosea'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: 'Joel'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..9).each do |i|
  temp = BibleBooks.find_by book: 'Amos'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..1).each do |i|
  temp = BibleBooks.find_by book: 'Obadiah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: 'Jonah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..7).each do |i|
  temp = BibleBooks.find_by book: 'Micah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: 'Nahum'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: 'Habakkuk'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: 'Zephaniah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..2).each do |i|
  temp = BibleBooks.find_by book: 'Haggai'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..14).each do |i|
  temp = BibleBooks.find_by book: 'Zechariah'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: 'Malachi'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..28).each do |i|
  temp = BibleBooks.find_by book: 'Matthew'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..16).each do |i|
  temp = BibleBooks.find_by book: 'Mark'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..24).each do |i|
  temp = BibleBooks.find_by book: 'Luke'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..21).each do |i|
  temp = BibleBooks.find_by book: 'John'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..28).each do |i|
  temp = BibleBooks.find_by book: 'Acts'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..16).each do |i|
  temp = BibleBooks.find_by book: 'Romans'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..16).each do |i|
  temp = BibleBooks.find_by book: '1 Corinthians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..13).each do |i|
  temp = BibleBooks.find_by book: '2 Corinthians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..6).each do |i|
  temp = BibleBooks.find_by book: 'Galatians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..6).each do |i|
  temp = BibleBooks.find_by book: 'Ephesians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: 'Philippians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: 'Colossians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..5).each do |i|
  temp = BibleBooks.find_by book: '1 Thessalonians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: '2 Thessalonians'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..6).each do |i|
  temp = BibleBooks.find_by book: '1 Timothy'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..4).each do |i|
  temp = BibleBooks.find_by book: '2 Timothy'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: 'Titus'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..1).each do |i|
  temp = BibleBooks.find_by book: 'Philemon'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..13).each do |i|
  temp = BibleBooks.find_by book: 'Hebrews'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..5).each do |i|
  temp = BibleBooks.find_by book: 'James'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..5).each do |i|
  temp = BibleBooks.find_by book: '1 Peter'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..3).each do |i|
  temp = BibleBooks.find_by book: '2 Peter'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..5).each do |i|
  temp = BibleBooks.find_by book: '1 John'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..1).each do |i|
  temp = BibleBooks.find_by book: '2 John'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..1).each do |i|
  temp = BibleBooks.find_by book: '3 John'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..1).each do |i|
  temp = BibleBooks.find_by book: 'Jude'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

(1..22).each do |i|
  temp = BibleBooks.find_by book: 'Revelation'
  BibleChapters.create(chapters: i, bible_books_id: temp.id )
end

xml = File.read("public/Bibles/asv.xml")
  
source = LibXML::XML::Parser.string(xml)
content = source.parse
verses = Array.new

content.find('//XMLBIBLE/BIBLEBOOK').each do |book|
  content.find('//XMLBIBLE/BIBLEBOOK[@bname="'+ book["bname"] +'"]/CHAPTER').each do |chapter| 
    content.find('//XMLBIBLE/BIBLEBOOK[@bname="'+ book["bname"] +'"]/CHAPTER[@cnumber='+ chapter["cnumber"] +']/VERS').each  do |verse|
      verses << [book["bname"], chapter["cnumber"].to_i, verse["vnumber"].to_i]
    end
  end
end

verses.each do |v|
  bible_book = BibleBooks.where(:book => v[0]).select("id")
  bible_chapter = BibleChapters.where(:chapters => v[1].to_i, :bible_books_id => bible_book).select("id").first
  if bible_chapter[:id] > 0 && v[2].to_i > 0 then
    BibleVerse.create(bible_chapters_id: bible_chapter[:id], bible_verse: v[2].to_i)
  end
end

book = BibleBooks.find_by(book: 'Genesis')
book.abbreviation = 'Gen'
book.save!

book = BibleBooks.find_by(book: 'Exodus')
book.abbreviation = 'Exod'
book.save!

book = BibleBooks.find_by(book: 'Leviticus')
book.abbreviation = 'Lev'
book.save!

book = BibleBooks.find_by(book: 'Numbers')
book.abbreviation = 'Num'
book.save!

book = BibleBooks.find_by(book: 'Deuteronomy')
book.abbreviation = 'Deut'
book.save!

book = BibleBooks.find_by(book: 'Joshua')
book.abbreviation = 'Josh'
book.save!

book = BibleBooks.find_by(book: 'Judges')
book.abbreviation = 'Judg'
book.save!

book = BibleBooks.find_by(book: 'Ruth')
book.abbreviation = 'Ruth'
book.save!

book = BibleBooks.find_by(book: '1 Samuel')
book.abbreviation = '1Sam'
book.save!

book = BibleBooks.find_by(book: '2 Samuel')
book.abbreviation = '2Sam'
book.save!

book = BibleBooks.find_by(book: '1 Kings')
book.abbreviation = '1Kgs'
book.save!

book = BibleBooks.find_by(book: '2 Kings')
book.abbreviation = '2Kgs'
book.save! 

book = BibleBooks.find_by(book: '1 Chronicles')
book.abbreviation = '1Chr'
book.save! 

book = BibleBooks.find_by(book: '2 Chronicles')
book.abbreviation = '2Chr'
book.save! 

book = BibleBooks.find_by(book: 'Ezra')
book.abbreviation = 'Ezra'
book.save! 

book = BibleBooks.find_by(book: 'Nehemiah')
book.abbreviation = 'Neh'
book.save! 

book = BibleBooks.find_by(book: 'Esther')
book.abbreviation = 'Esth'
book.save! 

book = BibleBooks.find_by(book: 'Job')
book.abbreviation = 'Job'
book.save! 

book = BibleBooks.find_by(book: 'Psalm')
book.abbreviation = 'Ps'
book.save! 

book = BibleBooks.find_by(book: 'Proverbs')
book.abbreviation = 'Prov'
book.save! 

book = BibleBooks.find_by(book: 'Ecclesiastes')
book.abbreviation = 'Eccl'
book.save! 

book = BibleBooks.find_by(book: 'Song of Solomon')
book.abbreviation = 'Song'
book.save! 

book = BibleBooks.find_by(book: 'Isaiah')
book.abbreviation = 'Isa'
book.save! 

book = BibleBooks.find_by(book: 'Jeremiah')
book.abbreviation = 'Jer'
book.save! 

book = BibleBooks.find_by(book: 'Lamentations')
book.abbreviation = 'Lam'
book.save! 

book = BibleBooks.find_by(book: 'Ezekiel')
book.abbreviation = 'Ezek'
book.save! 

book = BibleBooks.find_by(book: 'Daniel')
book.abbreviation = 'Dan'
book.save! 

book = BibleBooks.find_by(book: 'Hosea')
book.abbreviation = 'Hos'
book.save! 

book = BibleBooks.find_by(book: 'Joel')
book.abbreviation = 'Joel'
book.save! 

book = BibleBooks.find_by(book: 'Amos')
book.abbreviation = 'Amos'
book.save! 

book = BibleBooks.find_by(book: 'Obadiah')
book.abbreviation = 'Obad'
book.save! 

book = BibleBooks.find_by(book: 'Jonah')
book.abbreviation = 'Jonah'
book.save! 

book = BibleBooks.find_by(book: 'Micah')
book.abbreviation = 'Mic'
book.save! 

book = BibleBooks.find_by(book: 'Nahum')
book.abbreviation = 'Nah'
book.save! 

book = BibleBooks.find_by(book: 'Habakkuk')
book.abbreviation = 'Hab'
book.save! 

book = BibleBooks.find_by(book: 'Zephaniah')
book.abbreviation = 'Zeph'
book.save! 

book = BibleBooks.find_by(book: 'Haggai')
book.abbreviation = 'Hag'
book.save! 

book = BibleBooks.find_by(book: 'Zechariah')
book.abbreviation = 'Zech'
book.save! 

book = BibleBooks.find_by(book: 'Malachi')
book.abbreviation = 'Mal'
book.save! 

book = BibleBooks.find_by(book: 'Matthew')
book.abbreviation = 'Matt'
book.save! 

book = BibleBooks.find_by(book: 'Mark')
book.abbreviation = 'Mark'
book.save! 

book = BibleBooks.find_by(book: 'Luke')
book.abbreviation = 'Luke'
book.save! 

book = BibleBooks.find_by(book: 'John')
book.abbreviation = 'John'
book.save! 

book = BibleBooks.find_by(book: 'Acts')
book.abbreviation = 'Acts'
book.save! 

book = BibleBooks.find_by(book: 'Romans')
book.abbreviation = 'Rom'
book.save! 

book = BibleBooks.find_by(book: '1 Corinthians')
book.abbreviation = '1Cor'
book.save! 

book = BibleBooks.find_by(book: '2 Corinthians')
book.abbreviation = '2Cor'
book.save! 

book = BibleBooks.find_by(book: 'Galatians')
book.abbreviation = 'Gal'
book.save! 

book = BibleBooks.find_by(book: 'Ephesians')
book.abbreviation = 'Eph'
book.save! 

book = BibleBooks.find_by(book: 'Philippians')
book.abbreviation = 'Phil'
book.save! 

book = BibleBooks.find_by(book: 'Colossians')
book.abbreviation = 'Col'
book.save! 

book = BibleBooks.find_by(book: '1 Thessalonians')
book.abbreviation = '1Thess'
book.save! 

book = BibleBooks.find_by(book: '2 Thessalonians')
book.abbreviation = '2Thess'
book.save! 

book = BibleBooks.find_by(book: '1 Timothy')
book.abbreviation = '1Tim'
book.save! 

book = BibleBooks.find_by(book: '2 Timothy')
book.abbreviation = '2Tim'
book.save! 

book = BibleBooks.find_by(book: 'Titus')
book.abbreviation = 'Titus'
book.save! 

book = BibleBooks.find_by(book: 'Philemon')
book.abbreviation = 'Phlm'
book.save! 

book = BibleBooks.find_by(book: 'Hebrews')
book.abbreviation = 'Heb'
book.save! 

book = BibleBooks.find_by(book: 'James')
book.abbreviation = 'Jas'
book.save! 

book = BibleBooks.find_by(book: '1 Peter')
book.abbreviation = '1Pet'
book.save! 

book = BibleBooks.find_by(book: '2 Peter')
book.abbreviation = '2Pet'
book.save! 

book = BibleBooks.find_by(book: '1 John')
book.abbreviation = '1John'
book.save! 

book = BibleBooks.find_by(book: '2 John')
book.abbreviation = '2John'
book.save! 

book = BibleBooks.find_by(book: '3 John')
book.abbreviation = '3John'
book.save! 

book = BibleBooks.find_by(book: 'Jude')
book.abbreviation = 'Jude'
book.save! 

book = BibleBooks.find_by(book: 'Revelation')
book.abbreviation = 'Rev'
book.save! 
