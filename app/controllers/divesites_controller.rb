class DivesitesController < ApplicationController
  before_action :authenticate_user!, only: %i[ show ]

  def index
    @divesites = Divesite.all
    @areas = @divesites.pluck(:area).uniq

    gon.divesites = @divesites.map do |ds|
      co = ds.conditions.where(created_at:Time.zone.now.all_day).last
      if co == nil
        st = "noinfo"
      else
        st = co.status
      end
      { id: ds.id,
        name: ds.name,
        latitude: ds.latitude,
        longitude: ds.longitude,
        status: st,
       }
    end
  end

  def show
    @divesite = Divesite.find(params[:id])
    @favorite = current_user.favorites.find_by(divesite_id: @divesite.id)
    @conditions = Condition.where(divesite_id: @divesite.id).order(created_at: :DESC)
  end

  def select_map
    respond_to do |format|
      if params[:zone]
        @divesites = Divesite.all
        @zones = @divesites.where(zone: params[:zone])
        format.js { render :select_zone }
      else
        format.html { redirect_to divesites_url, notice: '表示したいエリアを選択してください' }
      end
    end
  end
end
