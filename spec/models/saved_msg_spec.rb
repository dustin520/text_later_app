require 'rails_helper'

RSpec.describe SavedMsg, :type => :model do

 #  it "has necessary attributes" do
 #    sm = SavedMsg.new(subject: "Goodbye", content: "Today is Friday - best day of the week!", time: "8:00AM 2014-AUG-29", send_num: "6507044251")
	# expect(sm.subject).to eq("Goodbye")
	# expect(sm.content).to eq("Today is Friday - best day of the week!")
	# expect(sm.time).to eq("8:00AM 2014-AUG-29")
	# expect(sm.send_num).to eq("6507044251")
 #  end


 subject { FactoryGirl.create(:saved_msg)}

	it "creates a text, saves it to db, and sends to a number" do
		expect(subject).to be_valid
	end 

end
