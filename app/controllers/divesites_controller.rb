class DivesitesController < ApplicationController
  def index
    @divesites = Divesite.all
    @areas = @divesites.pluck(:area).uniq
  end

  def show
    @divesite = Divesite.find(params[:id])
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
