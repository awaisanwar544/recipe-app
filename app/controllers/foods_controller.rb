class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food Created'
    else
      @errors = @food.errors.full_messages
      render :new
    end
  end

  def destroy
    food = current_user.foods.find(params[:id])
    food.destroy
    redirect_to foods_path, notice: "Deleted food: #{food.name}"
  end

  private

  def food_params
    params.require(:food).permit(:name, :measuring_unit, :price)
  end
end
