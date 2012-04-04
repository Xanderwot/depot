class Admin::UsersController < ApplicationController

    load_and_authorize_resource
	layout 'admin'

	def create
        @user = User.new(params[:user])
        if @user.save
            redirect_to admin_users_path
        else
            render :new
        end  	 
	end

	def update
        if @user.update_attributes(params[:user])
       	    redirect_to admin_users_path
        else
            render :new
        end
	end	

	def destroy
        @user.destroy
        redirect_to admin_users_path
	end	

end
