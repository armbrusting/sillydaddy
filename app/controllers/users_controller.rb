class UsersController < ApplicationController
before_filter :authenticate_user!

  def show		
    @user = current_user	
	@photos = @user.photos 
	@top_photos = Photo.all.sort_by { |u| -u.votes.count } 

  end

end
