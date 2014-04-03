class AdminController < ApplicationController

	def index
	  
	  if user_signed_in?	
		
	  #check to see if admin account
		if user_signed_in? && current_user.role == 'admin'

		end
	  
  	  # otherwise, this person is trying to get into somewhere they shouldn't be
	  else
		redirect_to new_user_session_path
	  
	  end
	  	
	end
	
end