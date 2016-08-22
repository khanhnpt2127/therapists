class HostsController < ApplicationController
  before_action :check_cookie!
  before_action :authenticate_host!
  
  def new
    @host= Host.new
  end
  
  def index
    Rails.logger.info request.env["HTTP_COOKIE"]
  end
  
  
  def create
    @host = Host.new host_params
    if @host.save
      session[:host_id] = @host.id
      session[:user_id] = nil
      redirect_to root_path, notice: "Host successfully created"
    else
      render 'new'
    end
  end
  
  def users
    @users = User.all
  end
  
  def show
    @host = Host.find(params[:id])
     
  end


  private

  def host_params
    params.require(:host).permit(:name, :password, :email, :phone_number)
  end
end
