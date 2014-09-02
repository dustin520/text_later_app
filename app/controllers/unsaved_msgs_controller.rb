class UnsavedMsgsController < ApplicationController


	def index
	end

	def new
		@unsaved_msg = UnsavedMsg.new
		# binding.pry
	end

	def create
		new_message = params[:unsaved_msg].permit(:email, :send_num, :content, :time)
		puts "NEW MESSAGE IS HERE"	
		puts new_message["send_num"]
		@text_message = UnsavedMsg.create(new_message)

		# Change time to utc
		time = @text_message.time.utc
		p "THE TIME TO SCHEDULE IS: #{time}"

		if @text_message.save
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


end





