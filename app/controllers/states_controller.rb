class StatesController < ApplicationController
  def index
    @states = State.states_by_created_at 
  end

  def show
    @state = State.find(params[:id])
    @number_of_trails = @state.number_of_trails
  end



end