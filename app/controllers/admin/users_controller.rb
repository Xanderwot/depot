class Admin::UsersController < ApplicationController

	load_and_authorize_resource
	layout 'admin'

	def index
      @users = User.all
	end	

	def show
		@users = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end	

	def create
       @user = User.new(params[:user])
       if @user.save
       	 redirect_to admin_users_path
       else
         render :new
       end  	 
	end

	def update
		@user = User.find(params[:id])
       if @user.save
       	 redirect_to admin_users_path
       else
         render :new
       end
	end	

	def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
	end	
end
