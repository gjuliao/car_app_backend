class Api::V1::CarsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_car, only: %i[show update destroy]

  # GET /cars
  def index
    if can? :read, Car
      @cars = Car.all
      if @cars.empty?
        render_response(:not_found)
      else
        render_response(:found, payload: @cars)
      end
    else
      render_response(:unauthorized)
    end
  end

  # GET /cars/:id
  def show
    if can? :read, Car
      if @car.nil?
        render_response(:not_found)
      else
        render_response(:found, payload: @car)
      end
    else
      render_response(:unauthorized)
    end
  end

  # POST /cars
  def create
    if can? :create, Car
      @car = Car.new(car_params)
      if @car.save
        render_response(:created)
      else
        render_response(:unable_to_create)
      end
    else
      render_response(:unauthorized)
    end
  end

  # PUT /cars/:id
  def update
    if can? :update, Car
      if car_params.blank? || car_params.empty? || car_params.nil?
        render_response(:none_attribute)
      else
        @car.update(car_params) ? render_response(:updated) : render_response(:unable_to_update)
      end
    else
      render_response(:unauthorized)
    end
  end

  # DELETE /cars/:id
  def destroy
    if can? :destroy, Car
      if @car.destroy
        render_response(:deleted)
      else
        render_response(:unable_to_delete)
      end
    else
      render_response(:unauthorized)
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
