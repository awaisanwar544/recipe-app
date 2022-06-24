class RecipesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[public_recipes show]

  def index
    @recipes = current_user.recipes
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.recipe_foods.includes(:food)
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'Recipe Created'
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted Recipe: #{recipe.name}"
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :cooking_time, :preparation_time, :description, :public)
  end
end
