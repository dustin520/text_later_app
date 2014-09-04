class SiteController < ApplicationController

	def index	
		@unsaved_msg = UnsavedMsg.new
		user_name
	end


	def about
		user_name
		render :about	
	end

	def quote
		url = open("http://www.brainyquote.com/quotes/authors/b/bruce_lee.html").read

		page = Nokogiri::HTML(url)
			# p page
		results = page.css("div span a").map do |quote|
			quote.text
		end

		p results

		render :json => results
	end

end
