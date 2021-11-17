# frozen_string_literal: true

class ConditionsController < ApplicationController
  include ConditionsHelper
  before_action :authenticate_user!
  before_action :set_condition, only: %i[show destroy]

  def index
    @conditions = Condition.where(created_at: Time.zone.now.all_day).order(created_at: :DESC)
    @conditions = @conditions.page(params[:page]).per(12)
  end

  def show; end

  def new
    @condition = current_user.conditions.new
    divesites = Divesite.select(:id, :name, :area, :zone).order(id: :ASC)
    zones = divesites.pluck(:zone).uniq
    areas = divesites.pluck(:area).uniq
    divesites = areas.map do |area|
      area_arr = divesites.where(area: area)
      zones.map do |zone|
        area_arr.where(zone: zone)
      end
    end
    @divesites = divesites.map do |divesite|
      divesite.delete_if(&:empty?)
    end
  end

  def create
    @condition = current_user.conditions.build(condition_params)
    if @condition.save
      redirect_to @condition
      flash[:notice] = '本日の海況情報を投稿しました！Twitterでも海況を投稿しよう！'
    else
      flash[:alert] = '不足箇所を入力してください'
      @condition = Condition.new(condition_params)
      render :new
    end
  end

  def destroy
    @condition.destroy
    redirect_to conditions_url
    flash[:notice] = '海況情報を削除しました！'
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def condition_params
    params.require(:condition).permit(:divepoint, :status, :temperature, :visibility, :content, :image, :image_cache,
                                      :divesite_id)
  end
end
