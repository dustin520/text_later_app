class SiteController < ApplicationController

	def index	
		@unsaved_msg = UnsavedMsg.new
	end


	def about
		render :about	
	end

end
