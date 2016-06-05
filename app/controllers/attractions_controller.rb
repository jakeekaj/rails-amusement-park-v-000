class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]



  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def edit
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render 'attractions/new'
    end
  end

  def update
    if current_user.admin
      @attraction.update(attraction_params)
      flash[:notice] = 'Attraction was successfully updated.'
      redirect_to @attraction
    end
  end

  

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name,:min_height,:tickets,:happiness_rating,:nausea_rating)
  end
end
