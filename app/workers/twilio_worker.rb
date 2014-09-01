class	TwilioWorker
	include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(text_message_id)
  	text_message = UnsavedMsg.find(text_message_id)
  	number_to_send_to = text_message.send_num
  	from = '+14154888381'
  	content = text_message.content

		# Keys for API
		account_sid = ENV['TWILIO_SID']
	  auth_token = ENV['TWILIO_AUTH']
	  from = '+14154888381'

	  # Reaching out to Twilio API

		@client = Twilio::REST::Client.new account_sid, auth_token
		@client.account.messages.create(
			:from => from, 
			:to => number_to_send_to, 
			:body => content
		)




	end

end