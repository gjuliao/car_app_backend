class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reservation, only: %i[show update destroy]

  # GET /reservations by user
  def index
    @reservations = Reservation.where(user_id: request.params['user_id'])
    if can? :read_user_reservations, @reservations.to_a
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
    if can? :read, @reservation
      if @reservation.nil?
        render_response(:not_found)
      else
        render_response(:found, payload: @reservation)
      end
    else
      render_response(:unauthorized)
    end
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id =request.params['user_id']
    if can? :create, @reservation
      if @reservation.save
        render_response(:created)
      else
        render_response(:unable_to_create)
      end
    else
      render_response(:found, payload: @reservation)
    end
  end

  # PUT /reservations/:id
  def update
    if can? :update, @reservation
      if %i[city start_date return_date user_id car_id].any? { |param| params[param].present? }
        @reservation.update(reservation_params) ? render_response(:updated) : render_response(:unable_to_update)
      else
        render_response(:none_attribute)
      end
    else
      render_response(:found, payload: @reservation)
    end
  end

  # DELETE /reservations/:id
  def destroy
    if can? :destroy, @reservation
      if @reservation.destroy
        render_response(:cancelled)
      else
        render_response(:unable_to_cancel)
      end
    else
      render_response(:found, payload: @reservation)
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :start_date, :return_date, :user_id, :car_id)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_response(:not_found)
  end
end
