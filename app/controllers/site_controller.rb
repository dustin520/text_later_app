class SiteController < ApplicationController

	def index	
		@unsaved_msg = UnsavedMsg.new
	end

end
