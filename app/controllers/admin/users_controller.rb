class Admin::UsersController < AdminController

  load_and_authorize_resource

	def create
    respond_with [:admin, @user], :notice => "User created" 
	end

	def update
    @user.attributes = params[:user]
    @user.role = params[:user][:role] if can? :assign_role, @user  
    @user.save
    respond_with [:admin, @user], :notice => "User updated"
  end	

	def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User destroyed"
	end	

end