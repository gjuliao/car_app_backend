class Api::V1::CarsController < ApplicationController
  before_action :find_car, only: %i[show update destroy]
  # GET /cars
  def index
    @cars = Car.all
    if @cars.empty?
      render_response(:not_found)
    else
      render_response(:found, payload: @cars)
    end
  end

  # GET /cars/:id
  def show
    if @car.nil?
      render_response(:not_found)
    else
      render_response(:found, payload: @car)
    end
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    if @car.save
      render_response(:created)
    else
      render_response(:unable_to_create)
    end
  end

  # PUT /cars/:id
  def update
    if car_params.blank? || car_params.empty? || car_params.nil?
      render_response(:none_attribute)
    else
      @car.update(car_params) ? render_response(:updated) : render_response(:unable_to_update)
    end
  end

  # DELETE /cars/:id
  def destroy
    if @car.destroy
      render_response(:deleted)
    else
      render_response(:unable_to_delete)
    end
  end

  private

  def car_params
    # Accessing a parameter that doesn't exist will raise a KeyError exception
    params.require(:car).permit(:model, :image, :description, :price, :brand, :year, :color, :is_electric, :accidents)
  rescue KeyError => e
    # Handle the exception by setting a default value for the missing parameter
    {}
  end

  def find_car
    @car = Car.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_response(:not_found)
  end
end
