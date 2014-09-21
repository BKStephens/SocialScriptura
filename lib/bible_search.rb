class BibleSearch
  require 'HTTParty'
  
  def self.get_verses_and_copyright(bible_hash)
    bible_book = BibleBooks.find_by(book: bible_hash[:book])
    verse_start = bible_hash[:verse_start] || 0
    verse_end = bible_hash[:verse_end] || 1000
 
    cached_bible_verses = BibleSearchCache.where(bible_version: bible_hash[:bible_version], 
                             bible_book_abbreviation: bible_book[:abbreviation], 
                             chapter: bible_hash[:chapter]) 
    
    if cached_bible_verses.any?
      get_verses_from_cache(cached_bible_verses, verse_start, verse_end)
    else
      get_verses_from_api(bible_hash, bible_book, verse_start, verse_end)
    end
    
  end

  private
   def self.get_verses_from_cache(cached_bible_verses, verse_start, verse_end)
     verses_and_copyright = Hash.new('')
     
     verses_and_copyright["copyright"] = cached_bible_verses[0]["copyright"]
     
     cached_bible_verses.each do |verse|
       if verse["verse"].to_i.between?(verse_start, verse_end)
         verses_and_copyright["verses"] += sanitize_string(verse["content"]) + ' '
       end
     end 

     return verses_and_copyright 
   end
   
   def self.get_verses_from_api(bible_hash, bible_book, verse_start, verse_end)
     url = "https://bibles.org/v2/chapters/eng-#{bible_hash[:bible_version]}:#{bible_book[:abbreviation]}.#{bible_hash[:chapter]}/verses.js"
     auth = {:username => ENV['BIBLESEARCH_KEY'], :password => ENV['BIBLESEARCH_PASSWORD']}
     headers = {'Content-Type' => 'application/json', 'Accept' => 'application/json' }
     response =  HTTParty.get(url, { basic_auth: auth, headers: headers })
 
     response_hash = ActiveSupport::JSON.decode(response)
    
     verses_and_copyright = Hash.new('')

     verses_and_copyright["copyright"] = response_hash["response"]["verses"][1]["copyright"] ? sanitize_string(response_hash["response"]["verses"][1]["copyright"]) : ''
     verses_and_copyright["fums"] = response_hash["response"]["meta"]["fums_noscript"]
     
     response_hash["response"]["verses"].each do |verse|
       if verse["verse"].to_i.between?(verse_start, verse_end)
         verses_and_copyright["verses"] += sanitize_string(verse["text"]) + ' '
       end

       #insert into db if not present
       BibleSearchCache.where(bible_version: bible_hash[:bible_version], 
                              bible_book_abbreviation: bible_book[:abbreviation], 
                              chapter: bible_hash[:chapter], 
                              verse: verse["verse"],
                              content: sanitize_string(verse["text"]),
                              copyright: verses_and_copyright["copyright"]).first_or_create
     end
  
     return verses_and_copyright
   end

   def self.sanitize_string(str)
     remove_h3_content(str)
     remove_newline(str)
     html_to_text(str) 
     remove_whitespace(str)
   end

   def self.remove_h3_content(html_string)
     html_string.gsub!(%r{<h3(?:.|\n|\r)+?</h3>}, '')
     return html_string
   end

   def self.html_to_text(html_string)
     if html_string 
       html_string.gsub!(%r{</?[^>]+?>}, '').to_s #remove html tags
       html_string.gsub!(/(?<digit>\d)(?<character>[a-zA-Z"])/,'\k<digit> \k<character>') #add space between digits and characters
     end
     
     return html_string
   end

   def self.remove_newline(html_string)
     html_string.delete!("\n")
     return html_string
   end

  def self.remove_whitespace(str)
     str.strip!
     return str 
  end
end
