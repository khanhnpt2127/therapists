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
            return redirect_to new_session_path, notice: "Password is wrong"
          end
        else
          return redirect_to new_session_path, notice: "Email is not exist"
        end
      end

    if params[:live] = true
      if @user = User.find_by(email: params[:email])
          if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:host_id] = nil
            return redirect_to root_path
          else
            return redirect_to root_path
          end
      else
        return redirect_to root_path
      end
    end
  end



  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
