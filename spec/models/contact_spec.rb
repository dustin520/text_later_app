require 'rails_helper'

RSpec.describe Contact, :type => :model do
 



  subject { FactoryGirl.create(:contact) }

  it "should create a new contact" do
    expect(subject).to be_valid
  end


	it "has necessary attributes" do
		c = Contact.new(first_name: "Jerry", last_name: "Wong", phone_num: "23478900983")
		expect(c.first_name).to eq("Jerry")
		expect(c.last_name).to eq("Wong")
		expect(c.phone_num).to eq("23478900983")				
	end


end
