class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(room_id: @room.id)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    # nilチェック + 日数計算
    if @reservation.start_at.present? && @reservation.end_at.present?
      use_days = (@reservation.end_at - @reservation.start_at).to_i
      use_days = 1 if use_days < 1
      room_money = @reservation.room&.money || 0
      people_count = @reservation.people || 1
      @reservation.total_price = people_count * room_money * use_days
    else
      @reservation.total_price = 0
    end

    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "予約が完了しました"
    else
      @room = Room.find(@reservation.room_id)
      flash.now[:alert] = @reservation.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "予約を削除しました"
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
