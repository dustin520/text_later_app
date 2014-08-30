class NoUserLogon < ActiveRecord::Base
	
	has_many :unsaved_msgs
end
