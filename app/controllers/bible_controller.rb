require 'open-uri'
require 'libxml'

class BibleController < ApplicationController
  def index
    initial_bible_view = BibleView.new('asv.xml', 'Genesis', 1)
    puts initial_bible_view.inspect
    xml_parser(initial_bible_view)
    comment_section
  end
  
  def xml_parser(bible_params)  
  	xml = File.read("public/Bibles/#{bible_params.bible_version}")
    
    source = LibXML::XML::Parser.string(xml)
    content = source.parse

    chapters = content.root.find('//XMLBIBLE/BIBLEBOOK[@bname="'+bible_params.book+'"]/CHAPTER[@cnumber='+bible_params.chapter.to_s+']')
    
    @output = ''
    chapters.each do |entry|
      entry.find('VERS').each do |verse|
        @output << verse["vnumber"]
        @output << ' '
        @output << verse.content
        @output << ' '
      end
    end
  end

  def comment_section
    @bible_comment = Comment.new
  end
end
