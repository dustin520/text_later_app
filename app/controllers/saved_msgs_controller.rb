class SavedMsgsController < ApplicationController

	def index
		find_user_id
		@savedMsg = @user.saved_msgs.all
	end

	def new
		find_user_id
		@savedMsg = @user.saved_msgs.new
	end

	def create
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
		redirect_to '/'
	end

	def show
		find_user_id
		savedMsg_id = params[:id]
		@savedMsg = @user.saved_msgs.find(savedMsg_id)
	end

	def edit
		find_user_id
		find_savedMsg
	end

	def update
		find_user_id
		savedMsg_id = params[:id]
		@savedMsg = @user.saved_msgs.find(savedMsg_id)
		# binding.pry
		updateMsg = params.require(:saved_msg).permit(:send_num, :subject, :content, :time)
		# binding.pry
		@savedMsg.update_attributes(send_num: updateMsg[:send_num], subject: updateMsg[:subject], content: updateMsg[:content], time: updateMsg[:time])

		redirect_to user_saved_msg_path, :notice => "Scheduled Message Updated!"
	end

	def destroy
		find_user_id
		find_savedMsg
		@savedMsg.destroy

		redirect_to user_saved_msgs_path, :notice => "Scheduled Text Deleted!"
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
