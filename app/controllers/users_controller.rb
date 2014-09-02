class UsersController < ApplicationController
 	def index
    @users = User.all
	end

  def new
    @user = User.new
  end

  def create
    user_info = params.require(:user).permit(:email, :password, :phone_num)
    @user = User.create(user_info)
		if @user.errors.any?
      # puts "no user was created, why?!?"
      flash.now[:notice] = "Can't create a new user! Are you a human?"
      render :new
		else
      # puts "a new user was created"
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), :notice => "You have just logged in!"
		end
		# redirect_to users_path
  end

  def show
    @current_user = current_user
    @user = User.find_by_id(params[:id])
    # savedMsg_id = params[:id]
    # @savedMsg = @user.saved_msgs.find(savedMsg_id)
    # @message = @user.savedmessages
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
