class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]) }
      format.js
    end
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    current_user.unfavorite(@post)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]) }
      format.js
    end
  end

end
