class UnsavedMsgsController < ApplicationController


	def index
	end

	def new
		@unsaved_msg = UnsavedMsg.new
		# binding.pry
	end

	def create
		new_message = params[:unsaved_msg].permit(:email, :send_num, :content, :time)
		@text_message = UnsavedMsg.create(new_message)

		# Change time to utc
		time = @text_message.time
		p "THE TIME TO SCHEDULE IS: #{time + 1*60}"

		if @text_message
			if @text_message.time == nil
				TwilioWorker.perform_async(@text_message.id)
				p "TIME IS NIL!!!!"
			elsif @text_message.time != nil
				send_time = (time.min - Time.now.min).to_i
				TwilioWorker.perform_at(send_time.minutes.from_now, @text_message.id)
			else
				render plain: "SOMTHING WENT WRONG"
			end

			render plain: "OK, Text Message was saved"

		else
			redirect_to '/'
		end

	end




# WORKING MODEL

	# 	# Storing messages to DB
	# 	new_message = params[:unsaved_msg].permit(:email, :send_num, :content, :time)
	# 	message = UnsavedMsg.create(new_message)


	# 	# Keys for API
	# 	account_sid = ENV['TWILIO_SID']
	#   auth_token = ENV['TWILIO_AUTH']
	#   from = '+14154888381'

	#   # For Multiple Recipients
	#   to = new_message[:send_num].split(",")

	#   # Reaching out to Twilio API
	#   to.each do |friends|
	# 		@client = Twilio::REST::Client.new account_sid, auth_token
	# 		@client.account.messages.create(
	# 			:from => from, 
	# 			:to => friends, 
	# 			:body => new_message[:content]
	# 		)
	# 	end
		
	# 	redirect_to '/'
	# end
# END HERE


	end





