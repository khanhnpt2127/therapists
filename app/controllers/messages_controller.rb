class MessagesController < ApplicationController  
  def show
    @message = Message.find params[:id]
    if @message.read? && current_user == @message.recipient
      @message.mark_as_read!
    end
  end
  
  def sent
    load_user
    @messages = @user.sent_messages
  end
 
  def new 
    @user = User.new
    @message = Message.new
  end
  
  def index
    @hosts = Host.all
    @user = User.find(params[:user_id])
    @message = Message.new
    @messages = Message.all
  end
  
  def received
    load_user
    @messages = @user.received_messages
  end

  def load_user
    if params[:user_id]
      @user = User.find params[:user_id]
    else
      @user = current_user
    end
  end

  def create
    @user = User.find params[:user_id]
    @message = Message.new message_params
    @message.sender_id = current_user.id
    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @messages } 
      else
        format.html { redirect_to root_path, notice: 'Error' }       
      end

    end
  end
  private

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  
  end
  
end
