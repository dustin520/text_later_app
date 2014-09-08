require 'rails_helper'

RSpec.describe Contact, :type => :model do



  subject { FactoryGirl.create(:contact) }

  it "should create a new contact" do
    expect(subject).to be_valid
  end


end
