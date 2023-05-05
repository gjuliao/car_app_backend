class Api::V1::CarsController < ApplicationController
  before_action :find_car, only: %i[show update destroy]
  # GET /cars
  def index
    @cars = Car.all
    if @cars.empty?
      render_response(:not_found)
    else
      render_response(:founded, payload: @cars)
    end
  end

  # GET /cars/:id
  def show
    if @car.nil?
      render_response(:not_found)
    else
      render_response(:founded, payload: @car)
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
    if %i[model image description price brand year color is_electric accidents].any? { |param| params[param].present? }
      @car.update(car_params) ? render_response(:updated) : render_response(:unable_to_update)
    else
      render_response(:none_attribute)
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

  def render_response(code, payload = {})
    render json: {
      errors: CAR_RESPONSES[code][:errors],
      message_code: code,
      message: CAR_RESPONSES[code][:message],
      **payload
    }, status: CAR_RESPONSES[code][:status]

  end

  def car_params
    params.require(:car).permit(:model, :image, :description, :price, :brand, :year, :color, :is_electric, :accidents)
  end

  def find_car
    @car = Car.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_response(:not_found)
  end
end
