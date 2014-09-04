class UserMailer < ActionMailer::Base
  
  def password_reset(user)
    @user = user
    mail :from => "team@textmelater.com", :to=> @user.email, :subject => "Please reset your password"
  end
end
