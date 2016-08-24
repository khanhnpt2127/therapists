class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_cookie!
  def index
    Rails.logger.info request.env["HTTP_COOKIE"]
    @users = User.all
  end

  def show
   #if current_user
    #  if current_user.email != @user.email 
     #   redirect_to root_path
     # end
    #else
   #   redirect_to root_path
    #end     
    @user = User.find(params[:id])
  end

  def hosts
    @hosts = Host.all
    @conversations = Conversation.all
    @review = Review.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      session[:host_id] = nil
      redirect_to new_survey_path, notice: "Account created successfully"
    else
      render 'new'
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to user_path(:id => current_user.id), notice: "Information updated"
    else render 'edit' 
    end  
  end



  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :description ,:email, :phone_number, :password)
  end

end
