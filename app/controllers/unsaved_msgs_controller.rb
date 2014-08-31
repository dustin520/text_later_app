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

		# Keys for API
		account_sid = ENV['TWILIO_SID']
	  auth_token = ENV['TWILIO_AUTH']
	  from = '+14154888381'

	  # For Multiple Recipients
	  to = new_message[:send_num].split(",")

	  # Reaching out to Twilio API
	  to.each do |friends|
			@client = Twilio::REST::Client.new account_sid, auth_token
			@client.account.messages.create(
				:from => from, 
				:to => friends, 
				:body => new_message[:content]
			)
		end

		redirect_to '/'
	end




end
