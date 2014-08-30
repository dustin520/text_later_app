class UnsavedMsgsController < ApplicationController

	def index
	end

	def new
		@unsaved_msg = UnsavedMsg.new
	end

	def create
		new_message = params[:unsaved_msg].permit(:email, :send_num, :content, :time)
		message = UnsavedMsg.create(new_message)

		

		redirect_to '/'
	end




end
