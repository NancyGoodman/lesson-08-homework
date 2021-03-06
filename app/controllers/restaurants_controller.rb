class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      # redirect to index action
      flash[:notice] = "Restaurant was saved successfully"
      redirect_to restaurants_path
    else
      flash[:notice] = "There was a problem saving this restaurant"
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def update
    @restaurant = Restaurant.find_by_id(params[:id])
    @restaurant.update(restaurant_params)

    #redirect to show action
    redirect_to restaurant_path(@character)
  end

  def destroy
    @restaurant = Restaurant.find_by_id(params[:id])
    @restaurant.delete
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

end
