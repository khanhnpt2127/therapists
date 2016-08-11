class HostsController < ApplicationController
  def new
    @host= Host.new
  end
  
  
  def create
    @host = Host.new host_params
    if @host.save
      redirect_to root_path, notice: "Host successfully created"
    else
      render 'new'
    end
  end
  
  def users
    @users = User.all
  end
  
  private

  def host_params
    params.require(:host).permit(:name, :password, :email, :phone_number)
  end
end
