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
		redirect_to login_url, notice: "Email was sent with instructions"
	end

	def edit
		# renders edit
		@user = User.find_by_code(params[:id])
	end

	def update
		@user = User.find_by_code(params[:id])

		if @user
      update_password = params.require(:user).permit(:password)
      @user.update_attributes(:password => update_password[:password])
			p "PASSWORD UPDATED"
			redirect_to '/'
		end

	end
end
