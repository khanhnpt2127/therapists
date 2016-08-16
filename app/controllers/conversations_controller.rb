class ConversationsController < ApplicationController

  def index
    if current_user
      @users = User.where.not(id: current_user.id)
      @conversations = Conversation.for(current_user)
    else
      @users = User.all
      @conversations = Conversation.for(current_host)
    end

    @hosts = Host.all
  end


  def create
    attrs = conversation_params    
    attrs[:sender] = current_user || current_host
    @conversation = Conversation.find_or_create_by(attrs)

    if @conversation.persisted?
      redirect_to conversation_messages_path(@conversation)
    else
      # Show error...
      flash[:error] = 'Cannot create conversation'
      redirect_to '/'
    end
  end


  private

  def conversation_params
    params.permit(:recipient_id, :recipient_type)
  end
end
