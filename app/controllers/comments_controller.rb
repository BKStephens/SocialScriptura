class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_user

  def get_user
    @user = User.find(current_user.id)
  end

  def index
    @comments = Comment.all
  end

   def update_verses
    bible_verses = BibleVerse.load_verses(comment_params[:chapter_start])
    
    respond_to do |format|
      format.json { render json: bible_verses.to_json }
    end
  end

  def show
    @comment = @user.comments.find(params[:id])
  end  

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { render json: @comment.to_json }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:book_start,:chapter_start,:verse_start,:chapter_end,:verse_end,:description,:date_time_stamp,:user_id)
    end
end
