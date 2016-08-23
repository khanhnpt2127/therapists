class SessionsController < ApplicationController
  def new

  end

  def create
      if @user = User.find_by(email: params[:email])
          if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            session[:host_id] = nil
            return redirect_to root_path, notice: "Password is wrong"
          else
            return redirect_to root_path, notice: "Email not Found"
          end
      else
        return redirect_to root_path, notice: "Login successful "
      end
    end



  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  end