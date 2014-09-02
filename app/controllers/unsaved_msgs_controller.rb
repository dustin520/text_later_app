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
		time = @text_message.time.utc
		p "THE TIME TO SCHEDULE IS: #{time}"

		if @text_message
			if @text_message.time == nil
				TwilioWorker.perform_async(@text_message.id)
				p "TIME IS NIL!!!!"
			elsif @text_message.time != nil
				start_time = Time.new(Time.now.year, Time.now.month,Time.now.day,Time.now.hour, Time.now.min)
				end_time = Time.new(time.year, time.month, time.day, time.hour, time.min)
				send_at = TimeDifference.between(start_time, end_time).in_minutes
				TwilioWorker.perform_at(send_at.minutes.from_now, @text_message.id)
			else
				render plain: "SOMTHING WENT WRONG"
			end

			render plain: "OK, Text Message was sent"

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





