require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 302 status code" do
      get :index
      expect(response).to have_http_status(302)
    end
    
  end
end