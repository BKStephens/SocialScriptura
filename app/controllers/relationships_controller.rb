class RelationshipsController < ApplicationController
  #before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  # GET /relationships.json
  def index
    #@relationships = Relationship.all
    @user = current_user
    content_stream
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show
    @user = current_user #User.find(@relationship.user_id)
  end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
  end


  def content_stream
      @content_stream = current_user.most_recent_content_stream
      # raise @content_stream.to_yaml
  end
  # GET /relationships/1/edit
  # def edit
  # end

  # POST /relationships
  # POST /relationships.json
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

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  # def update
  #   respond_to do |format|
  #     if @relationship.update(relationship_params)
  #       format.html { redirect_to @relationship, notice: 'Relationship was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @relationship.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    Relationship.destroy(user = current_user.id, friend = params[:friend_id])
    respond_to do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = current_user.relationships.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:user_id, :friend_id, :status)
    end
end
