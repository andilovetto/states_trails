class TrailsController < ApplicationController

  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
  end

  def update
    trail = Trail.find(params[:id])
    trail.update(trails_params)

    redirect_to "/trails/#{trail.id}"
  end

  private

  def trails_params
    params.permit(:name, :seasonal_closures, :elevation, :mileage)
  end
end