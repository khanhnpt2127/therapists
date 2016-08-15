class ConversationsController < ApplicationController


	def index
	if current_user
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.for(current_user.id)
  else
    @users = Host.where.not(id: current_host.id)
    @conversations = Conversation.for(current_host.id)
  end
    @hosts = Host.all
	 end


	def create
	 if Conversation.between(params[:sender_id],params[:recipient_id])
	   .present?
	    @conversation = Conversation.between(params[:sender_id],
	     params[:recipient_id]).first
	 else
	  @conversation = Conversation.create!(conversation_params)
	 end
	 redirect_to conversation_messages_path(@conversation)
	end

	private
	 def conversation_params
	  params.permit(:sender_id, :recipient_id, :host_id)
	 end
end

