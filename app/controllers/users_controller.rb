class UsersController < ApplicationController
 	def index
    @users = User.all
	end

  def new
    @user = User.new
  end

  def create
    user_info = params.require(:user).permit(:email, :phone_num)
    User.create(user_info)
			if @user
  			session[:user_id] = @user.id
      	redirect_to users_path, :notice => "You have just logged in!"
  		else
	      flash.now[:notice] = "Can't log you in"
	      render :new
			end
 				redirect_to users_path
  end

  def show
    @user = User.find_by_id(params[:id])
    @message = @user.savedmessages
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_info = params.require(:user).permit(:email, :phone_num)
    user = User.find_by_id(params[:id])
    user.update_attributes(user_info) if (user)
    redirect_to users_path
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    redirect_to users_path
  end
end
