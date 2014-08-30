class XmlParser
  require 'open-uri'
  require 'libxml'

  def parse_chapters(bible_params)  
    xml = File.read("public/Bibles/#{bible_params.bible_version}")
    
    source = LibXML::XML::Parser.string(xml)
    content = source.parse

    chapters = content.root.find('//XMLBIBLE/BIBLEBOOK[@bname="'+bible_params.book+'"]/CHAPTER[@cnumber='+bible_params.chapter.to_s+']')
    
    output = ''
    chapters.each do |entry|
      entry.find('VERS').each do |verse|
        output << verse["vnumber"]
        output << ' '
        output << verse.content
        output << ' '
      end
    end

    return output
  end

  def parse_chapters_and_verses(bible_hash)
    xml = File.read("public/Bibles/#{bible_hash['bible_version']}")
    
    source = LibXML::XML::Parser.string(xml)
    content = source.parse
    chapters = content.root.find('//XMLBIBLE/BIBLEBOOK[@bname="'+bible_hash['book']+'"]/CHAPTER[@cnumber='+bible_hash['chapter'].to_s+']')
    
    output = ''
    chapters.each do |chapter|
      chapter.find('VERS').each do |verse|
        
        if verse["vnumber"].to_i.between?(bible_hash['verse_start'], bible_hash['verse_end'])
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