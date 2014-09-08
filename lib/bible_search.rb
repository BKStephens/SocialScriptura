class BibleSearch
  require 'HTTParty'

  def self.get_verses_and_copyright(bible_hash)
    bible_book = BibleBooks.find_by(book: bible_hash[:book])
    verse_start = bible_hash[:verse_start] || 0
    verse_end = bible_hash[:verse_end] || 1000

    auth = {:username => ENV['BIBLESEARCH_KEY'], :password => ENV['BIBLESEARCH_PASSWORD']}
    response = HTTParty.get("https://bibles.org/v2/chapters/#{bible_hash[:bible_version]}:#{bible_book[:abbreviation]}.#{bible_hash[:chapter]}/verses.js", :basic_auth => auth)
    response_hash = ActiveSupport::JSON.decode(response)
   
    verses_and_copyright = Hash.new('')

    verses_and_copyright["copyright"] = response_hash["response"]["verses"][1]["copyright"]

    response_hash["response"]["verses"].each do |verse|
      if verse["verse"].to_i.between?(verse_start, verse_end)
        verses_and_copyright["verses"] += verse["text"] + ' '
      end
    end
    
    html_to_text(verses_and_copyright["copyright"])
    remove_h3_content(verses_and_copyright["verses"])
    remove_newline(verses_and_copyright["verses"])
    html_to_text(verses_and_copyright["verses"])

    return verses_and_copyright
  end

  private
   def self.remove_h3_content(html_string)
     html_string.gsub!(%r{<h3(?:.|\n|\r)+?</h3>}, '')
   end

   def self.html_to_text(html_string)
     html_string.gsub!(%r{</?[^>]+?>}, ' ').strip!
   end

   def self.remove_newline(html_string)
     html_string.delete!("\n")
   end
end
