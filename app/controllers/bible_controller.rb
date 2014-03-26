class BibleController < ApplicationController
  before_filter :authenticate_user!
  require 'XmlParser'

  def index
    @users_bible_view ||= BibleView.new
    xml_parser(@users_bible_view)
    comment_section
  end
  
  def xml_parser(bible_params)  
  	parser = ::XmlParser.new
    @output = parser.parse_chapters(bible_params)
  end

  def comment_section
    @bible_comment = Comment.new
  end

  def content_stream
    @content_stream = current_user.comments_around_chapter(@users_bible_view.book, @users_bible_view.chapter).to_json
  end

  def update_bible_view
    @users_bible_view = BibleView.new(comment_params)
    xml_parser(@users_bible_view)
    content_stream
    
    respond_to do |format|
        format.html { render :json => { :bible_content => @output,
                                        :content_stream => @content_stream }}
        format.js
        format.json { render :json => { :bible_content => @output,
                                :content_stream => @content_stream }}
    end
  end

  private

   def comment_params
      params.require(:bible_view).permit(:bible_version, :chapter, :verse_from, :verse_to)
    end
end