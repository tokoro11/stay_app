class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new #空のインスタンスを生成
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new(room_id: @room.id)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room) #リダイレクト先をshowに変更
    else
      flash.now[:alert] = "必須項目を正しく入力してください"
      render :new
    end
  end

  def search
    if params[:live].present?
      @rooms = Room.where('live LIKE ?', "%#{params[:live]}%")
    else
      @rooms = Room.none
    end
      @total_count = @rooms.count
  end



  private
  def room_params
    params.require(:room).permit(:title, :string, :content, :text, :money, :integer, :live, :text, :image) #「:image」を追加
  end  
end
