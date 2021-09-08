class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(divesite_id: params[:divesite_id])
    @divesite = Divesite.find(@favorite.divesite_id)
    @msg = "#{@favorite.divesite.name}をお気に入りダイブサイトに登録しました"
    respond_to do |format|
      format.js { render :like }
      format.html { redirect_to divesite_url(@favorite.divesite_id) }
    end
  end
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @divesite = Divesite.find(@favorite.divesite.id)
    @msg = "#{@favorite.divesite.name}をお気に入りダイブサイトから削除しました"
    respond_to do |format|
      if @favorite.destroy
        @favorite = nil
        format.js { render :dislike }
      else
        format.html { redirect_to divesite_url(@favorite.divesite_id) }
      end
    end
  end
end
