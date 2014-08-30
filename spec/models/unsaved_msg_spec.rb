require 'rails_helper'

RSpec.describe UnsavedMsg, :type => :model do

  it "has necessary attributes" do
    um = UnsavedMsg.new(email: "tacos@gmail.com", phone_num: "8008886666", subject: "Goodbye", content: "Today is Friday - best day of the week!", time: "8:00AM 2014-AUG-29", send_num: "6507044251")
    expect(um.email).to eq("tacos@gmail.com")
	expect(um.phone_num).to eq("8008886666")
	expect(um.subject).to eq("Goodbye")
	expect(um.content).to eq("Today is Friday - best day of the week!")
	expect(um.time).to eq("8:00AM 2014-AUG-29")
	expect(um.send_num).to eq("6507044251")
  end

end
