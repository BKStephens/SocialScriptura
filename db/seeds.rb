# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bible_version = [
  [ 'American Standard Version', 'ASV', 'asv.xml' ],
  [ 'American King James Version', 'AKJV', 'akjv.xml'],
  [ 'King James Version', 'KJV', 'kjv.xml' ]
]

bible_version.each do |name, abbreviation, file_name|
  BibleVersion.create( name: name, abbreviation: abbreviation, file_name: file_name )
end

books_list = ['Genesis','Exodus','Leviticus','Numbers','Deuteronomy','Joshua','Judges','Ruth',
	'1 Samuel','2 Samuel','1 Kings','2 Kings','1 Chronicles','2 Chronicles','Ezra','Nehemiah',
	'Esther','Job','Psalms','Proverbs','Ecclesiastes','Song of Solomon','Isaiah','Jeremiah',
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
  temp = BibleBooks.find_by book: 'Psalms'
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