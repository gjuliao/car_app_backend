class Api::V1::ReservationsController < ApplicationController
  before_action :find_reservation, only: %i[show update destroy]
  # GET /reservations
  def index
    @reservations = Reservation.all
    if @reservations.empty?
      render_response(:not_found)
    else
      render_response(:found, payload: @reservations)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :start_date, :return_date)
  end

  # def find_reservation
  #   @reservation = Car.find(params[:id])
  # rescue ActiveRecord::RecordNotFound
  #   render_response(:not_found)
  # end
end
