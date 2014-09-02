class ScheduleWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false

	def perform(message_id)
		text = SavedMsg.find(message_id)
		friend = text.send_num
		# friends = text.send_num.split(",")
		p friend
		# binding.pry
		from = '+14154888381'
		content = text.content

		# Keys for API
		account_sid = ENV['TWILIO_SID']
	  auth_token = ENV['TWILIO_AUTH']

		# Twilio Req
		# friends.each do |friend|
			@client = Twilio::REST::Client.new account_sid, auth_token
			@client.account.messages.create(
				:from => from, 
				:to => friend, 
				:body => content
			)
		# end

	end

end		