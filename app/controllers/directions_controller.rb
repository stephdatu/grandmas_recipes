class DirectionsController < ApplicationController
before_action :set_recipe
before_action :set_direction, only: [:show, :edit, :update, :destroy]

  def new
    @direction = @recipe.directions.build
  end

  def create
    @direction = @recipe.directions.build(direction_params)
    if @direction.save
      flash[:notice] = "Direction has been created."
      redirect_to [@recipe, @direction]
    else
      flash[:alert] = "Direction has not been created."
      render action: "new"
    end
  end

  def show
  end

private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_direction
    @direction = @recipe.directions.find(params[:id])
  end

  def direction_params
    params.require(:direction).permit(:step_number, :description)
  end
end
