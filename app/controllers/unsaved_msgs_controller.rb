class UnsavedMsgsController < ApplicationController


	def index
	end

	def new
		@unsaved_msg = UnsavedMsg.new
		# binding.pry
	end

	def create
		# Storing messages to DB
		new_message = params[:unsaved_msg].permit(:email, :send_num, :content, :time)
		message = UnsavedMsg.create(new_message)
		# binding.pry

		# Keys for API
		account_sid = ENV["TWILIO_SID"]
	  auth_token = ENV["TWILIO_AUTH"]

	  # Reaching out to Twilio API
		@client = Twilio::REST::Client.new account_sid, auth_token
		@client.account.messages.create(
			:from => '+14154888381', 
			:to => new_message[:send_num], 
			:body => new_message[:content]
		)


		redirect_to '/'
	end




end
