# frozen_string_literal: true

class DivesitesController < ApplicationController
  before_action :authenticate_user!, only: %i[show]

  def index
    @divesites = Divesite.all.order(id: :ASC)
    @areas = @divesites.pluck(:area).uniq

    gon.divesites = @divesites.map do |divesite|
      condition = divesite.conditions.where(created_at: Time.zone.now.all_day).last
      status = if condition.nil?
                 'noinfo'
               else
                 condition.status
               end
      { id: divesite.id,
        name: divesite.name,
        latitude: divesite.latitude,
        longitude: divesite.longitude,
        status: status }
    end
  end

  def show
    @divesite = Divesite.find(params[:id])
    @favorite = current_user.favorites.find_by(divesite_id: @divesite.id)
    @conditions = Condition.where(divesite_id: @divesite.id).order(created_at: :DESC)
    @conditions = @conditions.page(params[:page]).per(7)
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
