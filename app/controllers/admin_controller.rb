class AdminController < ApplicationController

	load_and_authorize_resource   		
   	layout 'admin'
   	before_filter :authenticate_user!, :go_away

   	def go_away
   		unless current_user.role == "admin"
   			redirect_to(root_url, :notice => "good try =)")
   		end	
   	end	
		
end	