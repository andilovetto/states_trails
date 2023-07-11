class TrailsController < ApplicationController

  def index
    @trails = Trail.with_seasonal_closures
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

  def destroy
    trail = Trail.find(params[:id])
    trail.destroy

    redirect_to "/trails"
  end

  private

  def trails_params
    params.permit(:name, :seasonal_closures, :elevation, :mileage)
  end
end