class ChecksController < ApplicationController

  # before_action :permit_params, except: [:new ]
	def index
    @checks = Check.all
  end

	def new
		@room = Room.find(permit_params[:room_id])
		@check = Check.new(permit_params)
		@check.use_date = (@check.end_at - @check.start_at) / 1.day
		@check.totalmoney = @check.people * @room.money * @check.use_date 
		if @check.invalid?	
			render :new
		end
	end

	def back
		@check = Check.new(permit_params)
		render :new
	end

# 	def confirm
# 		@check = Check.new(@attr)
# 		@check.use_date = (@check.end_at - @check.start_at) / 1.day
# 		@check.totalmoney = @check.people * @room.money * @check.use_date #@check.money
# 		if @check.invalid?	
# 			render :new
# 		end
# end



	def show
		@Check = Check.find(params[:id])
		
	end

	def create
		@check = Check.create!(permit_params)
		redirect_to check_path(id: @check.id)
	end	

	private

	def permit_params
		 params.require(:check).permit(:check_date, :start_at, :end_at, :people, :room_id)
	end

	def set_complete
		params.require('check').permit(:check_date, :start_at, :end_at, :people, :use_date, :totalmoney)
	end

end
