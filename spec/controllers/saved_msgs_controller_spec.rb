require 'rails_helper'

RSpec.describe SavedMsgsController, :type => :controller do


	describe "GET #index" do
		it "responds successfully, 200 status code" do 
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
		
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

  end

end


