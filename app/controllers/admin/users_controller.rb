class Admin::UsersController < AdminController

    load_and_authorize_resource

	def create
    if @user.save
      redirect_to admin_users_path, :notice => "User created"
    else
      render :new
    end  
	end

	def update
    @user.update_attributes(params[:user])
    @user.update_attribute(:role, params[:user][:role]) if can? :assign_role, @user  
    redirect_to admin_user_path(@user), :notice => "User updated"
  end	

	def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "User destroyed"
	end	

end