class UserController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.create user_params
    if @user.save 
      redirect_to root_path, notice: "Account created successful"
    else
      render 'new'
    end
  end
  private 
  def user_params
    params.require(:user).permit(:name, :email, :description, :phone_number, :password)
  end
end
