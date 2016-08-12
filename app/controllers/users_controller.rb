class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    Rails.logger.info request.env["HTTP_COOKIE"]
    @users = User.all
  end

  def show
  end

  def hosts
    @hosts = Host.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_survey_path, notice: "Account created successful"
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :password)
  end

end
