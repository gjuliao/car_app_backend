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
    @reservation.user_id = request.params['user_id']
    if can? :create, @reservation
      if (@reservation.return_date >= @reservation.start_date)
        if overlapping_reservations?(@reservation).empty?
          if @reservation.save
            render_response(:created)
          else
            render_response(:unable_to_create)
          end
        else
          render_response(:busy)
        end
      else 
        render_response(:greater)
      end
    else
      render_response(:unauthorized)
    end

  # PUT /reservations/:id
  def update
    if can? :update, @reservation
      if reservation_params.blank? || reservation_params.empty? || reservation_params.nil?
        render_response(:none_attribute)
      else
        if @reservation.return_date >= @reservation.start_date
          if overlapping_reservations?(@reservation).empty?
            @reservation.update(reservation_params)? render_response(:updated): render_response(:unable_to_update)
          else
            render_response(:busy)
          end
        else
          render_response(:greater)
        end
      end
    else
      render_response(:unauthorized)
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
      render_response(:unauthorized)
    end
  end

  private

  def reservation_params
    # Accessing a parameter that doesn't exist will raise a KeyError exception
    params.require(:reservation).permit(:city, :start_date, :return_date, :user_id, :car_id)
  rescue KeyError
    # Handle the exception by setting a default value for the missing parameter
    {}
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_response(:not_found)
  end

  def overlapping_reservations?(reservation)
    Reservation.where(
      car: reservation.car
    ).where.not(
      id: reservation.id
    ).where(
      "(start_date <= :return_date AND return_date >= :start_date) OR (start_date >= :start_date AND start_date <= :return_date)",
      start_date: reservation.start_date,
      return_date: reservation.return_date
    )
  end  

end
