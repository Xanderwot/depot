class AdminController < ApplicationController

	load_and_authorize_resource   		
   	layout 'admin'
   	before_filter :authenticate_user!, :check_user_role

   	def check_user_role
   		unless current_user.role == "admin"
   			redirect_to(root_url, :notice => "good try =)")
   		end	
   	end	
		
end	