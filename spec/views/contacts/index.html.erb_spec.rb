require 'rails_helper'

RSpec.describe "contacts/index.html.erb", :type => :view do
  it 'displays contact details correctly' do
  	user = User.find_by_id(1)
    assign(:user, user)
    # @contacts = @user.contacts.all
    assign(:contacts, user.contacts.all)
    render

    expect(rendered).to match /Daniel/
  end
end
