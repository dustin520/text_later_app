class UnsavedMsgsController < ApplicationController


	def index
	end

	def new
		@unsaved_msg = UnsavedMsg.new
		# binding.pry
	end


	def create
		new_message = params[:unsaved_msg].permit(:send_num, :content, :time)
		puts "NEW MESSAGE IS HERE"	
		puts new_message[:time]

		@text_message = UnsavedMsg.create(new_message)

		# Change time to utc
		time = @text_message.time.utc
		p "THE TIME TO SCHEDULE IS: #{time}"

		start_time = Time.new(Time.now.year, Time.now.month,Time.now.day,Time.now.hour, Time.now.min)
		end_time = Time.new(time.year, time.month, time.day, time.hour, time.min)
		send_at = TimeDifference.between(start_time, end_time).in_minutes - 420

			
		TwilioWorker.perform_at(send_at.minutes.from_now, @text_message.id)
		
		respond_to do |f|
      f.json { render :json => @text_message, only: [:id, :send_num, :content, :time] }
    end

	end





end





