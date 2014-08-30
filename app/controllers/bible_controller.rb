class BibleController < ApplicationController
  before_filter :authenticate_user!
  require 'xml_parser'

  def index
    @users_bible_view = set_users_bible_view
    xml_parser(@users_bible_view)
    comment_section
  end

  def bible_search_versions_list
    @bible_search = ::BibleSearch.new
    render json: @bible_search.versions_list, status: 200
  end  

  def set_users_bible_view
    show
    unless @users_bible_view.present? then new_user_bible_view end

    return @users_bible_view
  end

  def show
    @users_bible_view = UserBibleView.where(users_id: current_user.id).first
  end

  def new_user_bible_view
    @users_bible_view = UserBibleView.new(users_id: current_user.id)
    @users_bible_view.save
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
    @users_bible_view = set_users_bible_view
    @users_bible_view.set_attributes(comment_params)
    @users_bible_view.save
    
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
      params.require(:user_bible_view).permit(:bible_version, :book, :chapter, :verse_from, :verse_to)
    end
end
