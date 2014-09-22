class XmlParser
  require 'open-uri'
  require 'libxml'

  def self.get_verses(bible_hash) 
    bible_file_name = ::BibleVersion.where(abbreviation: bible_hash['bible_version']).first['file_name']
    xml = File.read("public/Bibles/#{bible_file_name}")

    content = LibXML::XML::Parser.string(xml).parse
    chapters = content.root.find('//XMLBIBLE/BIBLEBOOK[@bname="'+bible_hash['book']+'"]/CHAPTER[@cnumber='+bible_hash['chapter'].to_s+']')
    
    verse_start = bible_hash['verse_start'] || 0
    verse_end = bible_hash['verse_end'] || 1000  

    output = ''
    chapters.each do |entry|
      entry.find('VERS').each do |verse|
        if verse["vnumber"].to_i.between?(verse_start, verse_end)
          output << verse["vnumber"]
          output << ' '
          output << verse.content
          output << ' '
        end
      end
    end

    return output
  end
end
