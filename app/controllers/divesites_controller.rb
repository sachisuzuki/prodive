class DivesitesController < ApplicationController
  before_action :authenticate_user!,only: %i[ show ]
  def index
    @divesites = Divesite.all
    @areas = @divesites.pluck(:area).uniq
    gon.divesites = @divesites
  end

  def show
    @divesite = Divesite.find(params[:id])
    @favorite = current_user.favorites.find_by(divesite_id: @divesite.id)
  end

  def select_map
    respond_to do |format|
      if params[:zone]
        @divesites = Divesite.all
        @zones = @divesites.where(zone: params[:zone])
        format.js { render :select_map }
      else
        format.html { redirect_to divesites_url, notice: '表示したいエリアを選択してください' }
      end
    end
  end
end
