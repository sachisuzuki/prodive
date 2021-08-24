class DivesitesController < ApplicationController
  def index
    @divesites = Divesite.all
    @areas = @divesites.pluck(:area).uniq
  end

  def show
    @divesite = Divesite.find(params[:id])
  end
end
