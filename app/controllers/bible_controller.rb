class BibleController < ApplicationController
  before_filter :authenticate_user!
  require 'xml_parser'

  def index
    @users_bible_view = set_users_bible_view
    @output = bible_content(@users_bible_view)
    comment_section
  end

  def bible_search_versions_list
    render json: ::BibleSearch.get_verses_and_copyright({:bible_version => 'eng-ESV', :book => 'Genesis', :chapter => '1', :verse_start => 1, :verse_end => 2})
  end  

  def show
    @users_bible_view = UserBibleView.where(users_id: current_user.id).first
  end

  def update
    @users_bible_view = set_users_bible_view
    @users_bible_view.set_attributes(comment_params)
    @users_bible_view.save
    
    @output = bible_content(@users_bible_view)
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

   def new_user_bible_view
     @users_bible_view = UserBibleView.new(users_id: current_user.id)
     @users_bible_view.save
   end

   def bible_content(bible_params)
     ::BibleSearch.get_verses_and_copyright(bible_params)["verses"]
   end
     
   def comment_section
     @bible_comment = Comment.new
   end

   def set_users_bible_view
     show
     unless @users_bible_view.present? then new_user_bible_view end

     return @users_bible_view
   end

   def content_stream
     @content_stream = current_user.comments_around_chapter(@users_bible_view.book, @users_bible_view.chapter).to_json
   end
end
