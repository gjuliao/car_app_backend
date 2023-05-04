class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user.reservations.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: {
        status: 201,
        message: 'Car reserved Successfully'
      }, status: :created
    else
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.destroy
      render json: {
        status: 200,
        message: 'Reservation removed Successfully'
      }, status: :ok
    else
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :car_id).with_defaults(user_id: current_user.id)
  end
end
