class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "Successfully added a Car"
      redirect_to cars_path
    else
      render "new"
    end
  end

  def index
    @cars = Car.all
  end

  def car_params
    params.require(:car).permit(
      :manufacturer_id,
      :name,
      :year,
      :mileage,
      :color,
      :description
      )
  end
end
