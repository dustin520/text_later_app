class ContactsController < ApplicationController

  def index
    session_id = session[ :user_id ]
    route_id   = params[ :user_id ]

    if session_id.to_i == route_id.to_i
      user_id = params[:user_id]
      @user = User.find_by_id(user_id)
      @contacts = @user.contacts.all
    end

  end

  def new
    session_id = session[ :user_id ]
    route_id   = params[ :user_id ]

    if session_id.to_i == route_id.to_i
      user_id = params[:user_id]
      @contacts = @user.contacts.new
    else
      redirect_to user_contacts_path(session_id)
    end
    
  end

  def create
  	
  end


  def edit
  end

  def update
  	
  end

  def destroy
  	
  end

end
