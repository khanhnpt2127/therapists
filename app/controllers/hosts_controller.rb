class HostsController < ApplicationController
  before_action :check_cookie!
  
  
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
      redirect_to host_path(:id => current_host.id), notice: "Host successfully created"
    else
      render 'new'
    end
  end
  
  def edit
      @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update host_params
      redirect_to host_path(:id => current_host.id), notice: "Information updated"
    else render 'edit' 
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
    params.require(:host).permit(:name, :password, :email, :phone_number, :description, :img_link)
  end
end
