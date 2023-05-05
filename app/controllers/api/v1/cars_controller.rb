class Api::V1::CarsController < ApplicationController
  before_action :find_car, only: %i[show update destroy]
  # GET /cars
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/:id
  def show
    render json: @car.to_json
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:model, :image, :description, :price, :brand, :year, :color, :is_electric, :accidents)
  end

  def find_car
    @car = Car.find(params[:id])
  end
end
