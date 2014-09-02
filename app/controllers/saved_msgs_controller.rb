class SavedMsgsController < ApplicationController

	def index
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id
			@savedMsg = @user.saved_msgs.all
		else
			redirect_to user_saved_msgs_path(session_id) 
		end
	end

	def new
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id
			@savedMsg = @user.saved_msgs.new
		else
			redirect_to new_user_saved_msg_path(session_id)
		end
	end

	def create
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id

			new_msg = params[:saved_msg].permit(:send_num, :subject, :content, :time)
			@text = @user.saved_msgs.create(new_msg)

			# Change to UTC time 
			time = @text.time.utc
			p "Time to Schedule: #{time}"

			# Sidekiq/Redis Magic w/ Twilio 
			if @text
				if @text.time == nil
					ScheduleWorker.perform_async(@text.id) # passed in as arg for message_id
					p "time is nil!"
				elsif @text.time != nil
					start = Time.new(Time.now.year, Time.now.month, Time.now.day, Time.now.hour, Time.now.min)
					finish = Time.new(time.year, time.month, time.day, time.hour, time.min)
					delay = TimeDifference.between(start, finish).in_minutes

					# to add multiple recipients - NOT Working ! FIX
					# friends = new_msg[:send_num].split(",")
					# friends.each do |friend|
						ScheduleWorker.perform_at(delay.minutes.from_now, @text.id)
					# end
				else 
					render plain: "What's wrong now? Something MUST Be FIXED!"
				end
				# render plain: "Your message was sent!"
				redirect_to user_saved_msgs_path(session_id)
			end


		# # Twilio Magic w/o Sidekiq/Redis - MULITIPLE RECIPIENTS WORKING
		# 	sender = "+14154888381"
		# 	receiver = new_msg[:send_num]
		# 	content = new_msg[:content]

		# 	# api_info
		# 	account_sid = ENV['TWILIO_SID']
		# 	auth_token = ENV['TWILIO_AUTH']

		# 	# Multiple Recipients
		# 	friends = new_msg[:send_num].split(",")

		# 	# binding.pry
		# 	friends.each do |friend|
		# 		@client = Twilio::REST::Client.new account_sid, auth_token
		# 		message = @client.account.messages.create(
		# 		    :from => sender,
		# 		    :to => friend,     # Replace with your phone number
		# 		    :body => content)   # Replace with your Twilio number
		# 			p message.sid
		# 	end # twilio magic ends 
		# 	redirect_to user_saved_msgs_path

		else
			# redirect_to new_user_saved_msg_path(session_id)
		end
	end

	def show
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i		
			find_user_id
			savedMsg_id = params[:id]
			@savedMsg = @user.saved_msgs.find(savedMsg_id)
		else
			redirect_to user_saved_msgs_path(session_id) 
		end
	end

	def edit
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id
			find_savedMsg
		else
			redirect_to user_saved_msgs_path(session_id)
		end	 
	end

	def update
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id
			savedMsg_id = params[:id]
			@savedMsg = @user.saved_msgs.find(savedMsg_id)
			# binding.pry
			updateMsg = params.require(:saved_msg).permit(:send_num, :subject, :content, :time)
			# binding.pry
			@savedMsg.update_attributes(send_num: updateMsg[:send_num], subject: updateMsg[:subject], content: updateMsg[:content], time: updateMsg[:time])

			redirect_to user_saved_msg_path, :notice => "Scheduled Message Updated!"
		else
			redirect_to user_saved_msgs_path(session_id)
		end
	end

	def destroy
		session_id = session[ :user_id ]
		route_id   = params[ :user_id ]
		
		if session_id.to_i == route_id.to_i
			find_user_id
			find_savedMsg
			@savedMsg.destroy

			redirect_to user_saved_msgs_path, :notice => "Scheduled Text Deleted!"
		else
			redirect_to user_saved_msgs_path(session_id)
		end		
	end

	# def destroyAll
	# 	if session_id.to_i == route_id.to_i
	# 		find_user_id
	# 		find_savedMsg
	# 		@user.savedMsgs.destroy_all
	# 		redirect_to user_saved_msgs_path, :notice => "All Messages DELETED!"
	# end


	private

	def find_user_id
		p params 
		user_id = params[:user_id]
		@user = User.find_by_id(user_id)
	end

	def find_savedMsg
		savedMsg_id = params[:id]
		@savedMsg = SavedMsg.find_by_id(savedMsg_id)
	end

	def api_info
		# Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = ENV['TWILIO_SID']
		auth_token = ENV['TWILIO_AUTH']
	end

end

