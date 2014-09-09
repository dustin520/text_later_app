require 'rails_helper'

RSpec.describe SavedMsgsController, :type => :controller do

	describe "GET #index" do
		it "responds successfully, 200 status code" do 
			route_params = {:user_id => 1}
			session_params = {:user_id => 1}
	   		get :index, route_params, session_params
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
		
		it "renders the index template" do
			route_params = {:user_id => 1}
			session_params = {:user_id => 1}
	   		get :index, route_params, session_params
			expect(response).to render_template(:index)
		end

  end

end
