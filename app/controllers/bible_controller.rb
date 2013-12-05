require 'open-uri'
require 'libxml'

class BibleController < ApplicationController
  def index
    xml_parser('sf_rsv.xml','1 Corinthians', '8')
  end

  def xml_parser(bible = "kjv.xml",book = "Genesis", chapter = "1")  
  	xml = File.read('public/Bibles/' + bible)

    source = LibXML::XML::Parser.string(xml)
    content = source.parse

    chapters = content.root.find('//XMLBIBLE/BIBLEBOOK[@bname="'+ book +'"]/CHAPTER[@cnumber="'+ chapter +'"]')
    
    output = []

    chapters.each do |entry|
      entry.find('VERS').each do |verse|
      	output << verse["vnumber"]
        output << verse.content
      end
    end

  	raise output.to_yaml
  end
end
