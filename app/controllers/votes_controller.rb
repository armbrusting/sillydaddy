class VotesController < ApplicationController
before_filter :authenticate_user!

  respond_to :html, :js

  def create
    @photos = Photo.all
    @photo = Photo.find(params[:vote][:photo_id])
    current_user.like!(@photo)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @photo = Vote.find(params[:id]).photo
    current_user.unlike!(@photo)
    respond_to do |format|
      format.js
    end
  end
end
