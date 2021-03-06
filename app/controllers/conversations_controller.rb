class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      @users = User.where.not(id: current_user.id)
      @conversations = Conversation.for(current_user)
    else
      @users = User.all
      @conversations = Conversation.for(current_host)
    end
    if current_host
      @hosts = Host.where.not(id: current_host.id)
    else
      @hosts = Host.all
    end
  end

  def new
    @conversation = Conversation.new
  end

  def create
    attrs = conversation_params    
    user = current_user || current_host

    @conversation = Conversation.between(user, conversation_params)

    if @conversation.blank?
      attrs[:sender] = user
      @conversation = Conversation.create(attrs)
    end

    if @conversation.persisted?
      redirect_to conversation_messages_path(@conversation)
    else
      # Show error...
      flash[:error] = 'Cannot create conversation'
      redirect_to '/'
    end
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    if @conversation.destroy
      redirect_to conversations_path, notice: "Conversations deleted successful"
    else
      redirect_to conversation_messages_path(@conversation), notice: "Cannot delete conversation"
    end
  end


  private

  def conversation_params
    params.permit(:recipient_id, :recipient_type)
  end

end
