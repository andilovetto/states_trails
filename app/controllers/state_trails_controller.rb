class StateTrailsController < ApplicationController
  
  def index
    @state = State.find(params[:id])
    @trails = @state.trails
  end
end