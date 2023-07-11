class StateTrailsController < ApplicationController
  
  def index
    @state = State.find(params[:id])
    @trails = @state.trails.order(name: :asc)
  end

  def new
    @state = State.find(params[:id])
  end

  def create
    state = State.find(params[:id])
    trail = state.trails.new(trails_params)
    trail.save

    redirect_to "/states/#{state.id}/trails"
  end

  private

  def trails_params
    params.permit(:name, :seasonal_closures, :mileage, :elevation)
  end

end