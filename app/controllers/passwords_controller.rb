class PasswordsController < ApplicationController
	
	def new
  	# renders reset password form
 	end

	def create
  	user = User.find_by_email(params[:email])
			if user
  		 	# start password flow
  		 	user.set_password_reset
  		 	UserMailer.password_reset(user).deliver
			end

		# render text: "User has been reset"
		redirect_to users_path, notice: "Email was sent with instructions"
	end
end
