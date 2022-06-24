class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_id]

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient Added'
    else
      @errors = @recipe_food.errors.full_messages
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    ingredient = RecipeFood.where(recipe_id: params[:recipe_id], food_id: params[:id])
    RecipeFood.destroy(ingredient.ids[0])
    redirect_to recipe_path(@recipe), notice: "Ingredient Deleted"
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
