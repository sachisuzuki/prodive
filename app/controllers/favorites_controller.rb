class FavoritesController < ApplicationController
  def create
    favorite =current_user.favorites.create(divesite_id: params[:divesite_id])
    redirect_to divesite_url(favorite.divesite_id)
    flash[:notice] = "#{favorite.divesite.name}をお気に入りダイブサイトに登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to divesite_url(favorite.divesite_id)
    flash[:warning] = "#{favorite.divesite.name}をお気に入りダイブサイトから削除しました"
  end
end
