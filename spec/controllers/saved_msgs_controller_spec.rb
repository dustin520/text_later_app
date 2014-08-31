require 'rails_helper'

RSpec.describe SavedMsgsController, :type => :controller do

	



  describe "GET #index" do
    it "responds successfully with HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "returns all of the posts" do
      post1 = Post.create(:author => "Tim")
      post2 = Post.create(:author => "Elie")
      get :index
      expect(assigns(:all_posts)).to match_array [post1, post2]
    end
  end


end


