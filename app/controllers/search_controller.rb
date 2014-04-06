class SearchController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	@users = User.all
  	# @users = User.where('full_name LIKE ?', "%#{params[:q]}%")
  	respond_to do |format|
  	  format.html
  	  format.json { render json: @users.where('full_name ILIKE ?', "%#{params[:q]}%").map { |n| {:id => n.id, :name => n.full_name } }}
  	end
  end
end
