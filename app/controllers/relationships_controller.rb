class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_relationship, only: [:show, :edit, :destroy]

  def index
    @user = current_user
    #content_stream
  end

  def show
    @user = current_user
  end

  def new
    @relationship = Relationship.new
  end


  def content_stream
    @content_stream = current_user.most_recent_content_stream.to_json

    respond_to do |format|
      format.html { render :json => { :content_stream => @content_stream }}
      format.js
      format.json { render :json => { :content_stream => @content_stream }}
    end
  end
  
  def create
    @relationship = current_user.relationships.request(user = current_user, friend = User.find(params[:friend_id]))
    
    respond_to do |format|
      if @relationship
        format.html { redirect_to '/relationships#index', notice: 'Friend request sent.' }
        format.json { render action: 'index', status: :created, location: @relationship }
      else
        format.html { redirect_to '/relationships#index', notice: 'There is already a pending friend request' }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    Relationship.accept(user = current_user.id, friend = params[:friend_id])
    
    respond_to do |format|
      format.html { redirect_to '/relationships#index', notice: 'Friend request accepted.' }
      format.json { render action: 'show', status: :created, location: '/relationships#index' }
    end
  end

  def destroy
    Relationship.destroy(user = current_user.id, friend = params[:friend_id])
    
    respond_to do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end

  private
    def set_relationship
      @relationship = current_user.relationships.find(params[:id])
    end

    def relationship_params
      params.require(:relationship).permit(:user_id, :friend_id, :status)
    end
end
