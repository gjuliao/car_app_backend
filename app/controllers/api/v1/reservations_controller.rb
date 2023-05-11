class Api::V1::ReservationsController < ApplicationController
  before_action :find_reservation, only: %i[show update destroy]
  # GET /reservations by user
  def index
    @current_user = User.find(request.params['user_id'])
    @reservations = @current_user.reservations
    if @reservations.empty?
      render_response(:not_found)
    else
      render_response(:found, payload: @reservations)
    end
  end

  # GET /reservations/:id
  def show
    if @reservation.nil?
      render_response(:not_found)
    else
      render_response(:found, payload: @reservation)
    end
  end

  # POST /reservations
  def create
    @current_user = User.find(request.params['user_id'])
    @reservation = @current_user.reservations.new(reservation_params)
    if @reservation.save
      render_response(:created)
    else
      render_response(:unable_to_create)
    end
  end

  # PUT /reservations/:id
  def update
    if %i[city start_date return_date user_id car_id].any? { |param| params[param].present? }
      @reservation.update(reservation_params) ? render_response(:updated) : render_response(:unable_to_update)
    else
      render_response(:none_attribute)
    end
  end

  # DELETE /reservations/:id
  def destroy
    if @reservation.destroy
      render_response(:cancelled)
    else
      render_response(:unable_to_cancel)
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
