class HostSessionsController < ApplicationController
  
  def new


  end
  
  def create
    if @host = Host.find_by(email: params[:email])
      if @host.authenticate(params[:password])
        session[:host_id] = @host.id
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged in"
      else
        redirect_to root_path, notice: "Password is wrong"
      end
    else
      redirect_to root_path, notice: 'Email not found'
    end
  end
  
  def destroy
    session[:host_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end

