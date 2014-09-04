require "rails_helper"

RSpec.describe UserMailer, :type => :mailer do
  describe "password_reset" do
    user = User.find_by_id(1)
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Please reset your password")
      expect(mail.to).to eq(["randall@ga.com"])
      expect(mail.from).to eq(["team@textmelater.com"])
    end

  end

end
