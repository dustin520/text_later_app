require "rails_helper"

RSpec.describe "user request" do

  it "renders root url" do
    get "/"
    expect(response).to render_template(:index)

    # post "/widgets", :widget => {:name => "My Widget"}

    # expect(response).to redirect_to(assigns(:widget))
    # follow_redirect!

    # expect(response).to render_template(:show)
    # expect(response.body).to include("Widget was successfully created.")
  end

end