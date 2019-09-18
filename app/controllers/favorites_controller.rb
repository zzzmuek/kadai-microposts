class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    favorite_micropost = Micropost.find(params[:micropost_id])
    current_user.addfav(favorite_micropost)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite_micropost = Micropost.find(params[:micropost_id])
    current_user.unfav(favorite_micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
