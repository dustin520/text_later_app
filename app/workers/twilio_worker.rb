class	TwilioWorker
	include Sidekiq::Worker
  # sidekiq_options retry: false

  def perform(text_message_id)
  	text_message = UnsavedMsg.find(text_message_id)
  	from = '+14154888381'
  	content = text_message.content

		# Keys for API
		account_sid = ENV['TWILIO_SID']
	  auth_token = ENV['TWILIO_AUTH']
	  from = '+14154888381'

  	to = text_message.send_num.split(",")
  	puts "THIS IS OUR ARRAY!"

	  # Reaching out to Twilio API
		@client = Twilio::REST::Client.new account_sid, auth_token
  	
  	to.each do |friend|
			@client.account.messages.create(
				:from => from, 
				:to => friend, 
				:body => content
			)
		end



	end

end