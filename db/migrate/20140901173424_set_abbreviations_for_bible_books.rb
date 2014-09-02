class SetAbbreviationsForBibleBooks < ActiveRecord::Migration
  def change
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
  end
end
