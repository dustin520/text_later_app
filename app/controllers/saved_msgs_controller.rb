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
			api_info
			# binding.pry
			@client = Twilio::REST::Client.new account_sid, auth_token
			message = @client.account.messages.create(:body => new_msg[:content],
			    :to => new_msg[:send_num],     # Replace with your phone number
			    :from => "+14154888381")   # Replace with your Twilio number
			p message.sid

			@user.saved_msgs.create(new_msg)
			redirect_to user_saved_msgs_path(session_id)
		else
			redirect_to new_user_saved_msg_path(session_id)
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

