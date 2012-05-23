class StaticPagesController < ApplicationController
  def home
	@user = current_user
	@photos = Photo.paginate(page: params[:page], :per_page => 10)
	if user_signed_in?
        @photo = current_user.votes.build
	end
	@top_photos = Photo.limit(3).sort_by { |u| -u.votes.count } 
  end

  def about
  end

  def rules
  end
end
