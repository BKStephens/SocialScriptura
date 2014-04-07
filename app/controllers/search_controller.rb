class SearchController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@users = User.search(params[:term])
  	
  	respond_to do |format|
  	  format.html
  	  format.json { 
  	  	render json: @users.map { 
  	  	  |u| {:id => u.id, :label => u.full_name} 
  	    }
  	  }
  	end
  end
end
