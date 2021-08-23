class DivesitesController < ApplicationController
  def index
    @divesites = Divesite.all
    @areas = @divesites.pluck(:area).uniq

    @kanto_divesites = @divesites.where(area: "関東")
  end

  def show
    @divesite = Divesite.find(params[:id])
  end
end
