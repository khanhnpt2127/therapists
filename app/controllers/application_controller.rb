class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_host

  def current_user
    return @current_user if @current_user 
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def current_host
    return @current_host if @current_host
    if session[:host_id]
      @current_host = Host.find(session[:host_id])
    end
  end

  def check_cookie!
    if session[:host_id].present? && session[:user_id].present?
      redirect_to root_path, notice: "Please clear your cookies"
    end
  end

  def check_user!
    redirect_to new_user_path unless current_user || current_host
  end

  def authenticate_user!
    redirect_to root_path unless current_user || current_host
  end

  def authenticate_host!
    redirect_to root_path unless current_host
  end

end
