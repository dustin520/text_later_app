require 'rails_helper'

RSpec.describe User, :type => :model do

	# it "should create a valid user" do 
	# 	user = FactoryGirl.build(:user)
	# 	expect(user).to be_valid
	# end

  subject { FactoryGirl.create(:user) }

  it "should create new user" do
    expect(subject).to be_valid
  end


  # it "has necessary attributes" do
  #   user = FactoryGirl.create(:user)
  #   expect(user.email).to eq("tacos@gmail.com")
  #   expect(user.password).to eq("password")
  #   expect(user.phone_num).to eq("8008886666")
  # end




end

