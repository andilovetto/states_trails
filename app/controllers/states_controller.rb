class StatesController < ApplicationController
  def index
    @states = State.states_by_created_at 
  end

  def show
    @state = State.find(params[:id])
    @number_of_trails = @state.number_of_trails
  end

  def new
  end

  def create
    state = State.new(states_params)
    state.save
    
    redirect_to "/states"
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    state = State.find(params[:id])
    state.update(states_params)

    redirect_to "/states/#{state.id}"
  end

  private

  def states_params
    params.permit(:name, :number_of_parks, :mountainous_terrain)
  end
  
end