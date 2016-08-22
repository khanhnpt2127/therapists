class SessionsController < ApplicationController
  def new

  end

  def create
    if params[:live] = true
      if @host = Host.find_by(email: params[:email])
          if @host.authenticate(params[:password])
            session[:host_id] = @host.id
            session[:user_id] = nil
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
