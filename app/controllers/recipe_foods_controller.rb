class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(id: params[:recipe_id]), notice: 'Ingredient Added'
    else
      @errors = @recipe_food.errors.full_messages
      render :new
    end
  end

  def destroy
    ingredient = RecipeFood.find(params[:id])
    ingredient.destroy
    redirect_to recipe_path(id: params[:recipe_id]), notice: 'Ingredient Deleted'
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
