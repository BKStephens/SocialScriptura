class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  # GET /relationships.json
  def index
    #@relationships = Relationship.all
    @user = current_user
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show
    @user = User.find(@relationship.user_id)
  end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
  end

  # GET /relationships/1/edit
  # def edit
  # end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = current_user.relationships.build(:friend_id => params[:friend_id])
    #Relationship.new(relationship_params)

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to @relationship, notice: 'Relationship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @relationship }
      else
        format.html { render action: 'new' }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
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
    @relationship.destroy
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
