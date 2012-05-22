class StaticPagesController < ApplicationController
  def home
	@user = current_user
	@photos = Photo.all
	if user_signed_in?
        @photo = current_user.votes.build
	end
	@top_photos = Photo.all.sort_by { |u| -u.votes.count } 
  end

  def about
  end

  def rules
  end
end
