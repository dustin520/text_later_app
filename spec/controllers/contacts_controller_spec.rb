require 'rails_helper'

RSpec.describe ContactsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      user = User.find_by_id(1)
      get :index, :user_id => user.id
      expect(response).to be_success
    end
  end

  describe "GET new" do
    it "returns http success" do
      user = User.find_by_id(1)
      get :new, :user_id => user.id
      expect(response).to be_success
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to be_success
    end
  end

end
