class AdminController < ApplicationController
   		
   	layout 'admin'
   	before_filter :authenticate_user!, :check_user_role

   	def check_user_role
   		unless current_user.role == "admin"
   			redirect_to(root_url, :notice => "you don't have permissions")
   		end	
   	end	
		
end	