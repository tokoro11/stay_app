class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
  @room = Room.find(params[:room_id])
  @reservation = Reservation.new(room: @room)
  end


  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      @room = Room.find(@reservation.room_id)
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(
      :room_id,
      :start_at,
      :end_at,
      :people
    )
  end
end
