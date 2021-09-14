class DivesitesController < ApplicationController
  before_action :authenticate_user!,only: %i[ show ]
  def index
    @divesites = Divesite.includes(:conditions)
    @areas = @divesites.pluck(:area).uniq

    # divesites_ids = @divesites.pluck(:id)
    # conditions = Condition.where(created_at: Time.zone.now.all_day)
    # conditions_status = divesites_ids.map do |ds_id|
    #   ds_arr = conditions.where(divesite_id: ds_id)
    #   conditions.map do |status|
    #     divesites_ids.where(id: status)
    #   end
    # end
    # conditions_status = divesites_ids.map do |ds_id|
    #   conditions.where(divesite_id: ds_id)
    #
    # end
    gon.divesites = @divesites
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
