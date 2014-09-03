class SiteController < ApplicationController

	def index	
		@unsaved_msg = UnsavedMsg.new
		user_name
	end


	def about
		user_name
		render :about	
	end

end
