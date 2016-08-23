class SessionsController < ApplicationController
  def new

  end

  def create
   if params[:pending] = true 
      if @host = Host.find_by(email: params[:email])
        if @host.authenticate(params[:password])
          session[:host_id] = @host.id
          session[:user_id] = nil
          return redirect_to root_path
        else
          return redirect_to host_login_path(pending: true), notice: "Password is wrong"
        end          
      else
        return redirect_to host_login_path(pending: true), notice: "Email does not exist"
      end
      if params[:pending] = false
        if @user = User.find_by(email: params[:email])
          if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:host_id] = nil
            return redirect_to root_path
          else
            redirect_to user_login_path(pending: false), notice: "Password is wrong"
          end
        else
          return redirect_to user_login_path(pending: false), notice: "Email does not exist"
        end
      end
    end





  def destroy
    if current_user
      session[:user_id] = nil
    end
    if current_host
      session[:host_id] = nil
    end
    redirect_to root_path
  end

end



