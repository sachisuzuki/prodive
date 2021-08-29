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
    @today = Date.current
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
