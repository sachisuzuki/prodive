class ConditionsController < ApplicationController
  include ConditionsHelper
  before_action :set_condition, only: %i[ show destroy ]
  def index
    @conditions = Condition.all
  end
  def show
  end
  def new
    @condition = Condition.new
    divesites = Divesite.select(:id, :name, :area, :zone)
    zones = divesites.pluck(:zone).uniq
    # ゾーン名
    areas = divesites.pluck(:area).uniq
    # エリア名
    # ds_areas = areas.map do |area|
    #   divesites.where(area: area)
    # end

    ds = areas.map do |area|
      area_arr = divesites.where(area: area)
      zones.map do |zone|
        area_arr.where(zone: zone)
      end
    end

    @divesites = ds.map do |ds|
      ds.delete_if(&:empty?)
    end


    # @ds = zones.map do |zone|
    #   divesites.where(zone: zone)
    # end
    # @ds = []
    # @ds = zones.map.with_index do |zone, index|
    #   ds_areas[index].where(zone: zone)
    # end
    #
    # @ds = zones.map do |zone|
    #   area = ds_area.map do ||
    # end

    # respond_to do |format|
    #   format.html { redirect_to @condition, notice: "@@@" }
    #   format.js { render :new }
    # end
  end
  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to @condition
      flash[:notice] = "本日の海況情報を投稿しました！"
    else
      render :new
    end
  end
  #
  # def edit
  # end
  # def update
  #   @condition.update(condition_params)
  #   redirect_to @condition
  #   flash[:notice] = "本日の海況情報を編集しました！"
  # end
  def destroy
    @condition.destroy
    redirect_to conditions_url
    flash[:notice] = "海況情報を削除しました！"
  end
  private
  def set_condition
    @condition = Condition.find(params[:id])
  end
  def condition_params
    params.require(:condition).permit(:divepoint, :status, :temperature, :visibility, :content, :image, :image_cache,)
  end
end
