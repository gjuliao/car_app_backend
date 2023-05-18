class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reservation, only: %i[show update destroy]

  # GET /reservations by user
  def index
    @reservations = Reservation.where(user_id: params[:user_id])

    if can?(:read_user_reservations, @reservations.to_a)
      if @reservations.empty?
        render_response(:not_found)
      else
        render_response(:found, payload: @reservations)
      end
    else
      render_response(:unauthorized)
    end
  end

  # GET /reservations/:id
  def show
    if can?(:read, @reservation)
      if @reservation
        render_response(:found, payload: @reservation)
      else
        render_response(:not_found)
      end
    else
      render_response(:unauthorized)
    end
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params.merge(user_id: params[:user_id]))

    if can?(:create, @reservation) && valid_reservation?(@reservation)
      if save_reservation(@reservation)
        render_response(:created)
      else
        render_response(:unable_to_create)
      end
    else
      render_response(:unauthorized)
    end
  end

  # PUT /reservations/:id
  def update
    if can?(:update, @reservation) && valid_reservation?(@reservation)
      if update_reservation(@reservation)
        render_response(:updated)
      else
        render_response(:unable_to_update)
      end
    else
      render_response(:unauthorized)
    end
  end

  # DELETE /reservations/:id
  def destroy
    if can?(:destroy, @reservation)
      if @reservation.destroy
        render_response(:cancelled)
      else
        render_response(:unable_to_cancel)
      end
    else
      render_response(:unauthorized)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :start_date, :return_date, :car_id)
  end

  def find_reservation
    @reservation = Reservation.find_by(id: params[:id])

    render_response(:not_found) if @reservation.nil?
  end

  def valid_reservation?(reservation)
    reservation.return_date >= reservation.start_date && overlapping_reservations?(reservation).empty?
  end

  def overlapping_reservations?(reservation)
    Reservation.where(car: reservation.car)
      .where.not(id: reservation.id)
      .where('(start_date <= :return_date AND return_date >= :start_date) OR (start_date >= :start_date AND start_date <= :return_date)', # rubocop: disable Layout/LineLength
             start_date: reservation.start_date,
             return_date: reservation.return_date)
  end

  def save_reservation(reservation)
    reservation.save
  end

  def update_reservation(reservation)
    reservation.update(reservation_params)
  end
end
