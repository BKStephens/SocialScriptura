require 'open-uri'
require 'libxml'

class BibleController < ApplicationController
  def index
    @users_bible_view ||= BibleView.new({:bible_version => 'asv.xml', :book => 'Genesis', :chapter => '1'})
    xml_parser(@users_bible_view)
    comment_section
    content_stream
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

  def content_stream
    @content_stream = current_user.comments_around_chapter(@users_bible_view.book, @users_bible_view.chapter)
  end

  def update_bible_view
    @users_bible_view = BibleView.new(comment_params)
    xml_parser(@users_bible_view)
    content_stream
    
    respond_to do |format|
        format.html { render json: @output.to_json }
        format.js
        format.json { render json: @output.to_json }
    end
    #respond_to do |format|
    #  format.html { render json: @users_bible_view.to_json }
    #  format.js
    #  format.json { render json: @users_bible_view.to_json }
    #end
  end

  private

   def comment_params
      params.require(:bible_view).permit(:bible_version, :book, :chapter, :verse_from, :verse_to)
    end
end