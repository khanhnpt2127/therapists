class MessagesController < ApplicationController
    before_action :get_conversation 
    before_action :secure_conversation
    def index

      @messages = @conversation.messages.order(created_at: :asc)
      if @messages.length > 10
         @over_ten = true
         @messages = @messages[-10..-1]
      end

      if params[:m]
         @over_ten = false
         @messages = @conversation.messages
      end
      @message = @conversation.messages.new

      if current_host
        user = 
          if @conversation.recipient.is_a?(User)
            @conversation.recipient
          elsif @conversation.sender.is_a?(User)
            @conversation.sender
          end

        @survey = user.try(:survey)
      end
    end

    def new
      @message = @conversation.messages.new
    end

    def create
      @message = @conversation.messages.new(message_params)
      if @message.save!
        redirect_to conversation_messages_path(@conversation)
      else
        raise 'Sum tin wong'
      end
    end

    private
    def message_params
      params.require(:message).permit(:body, :user_id, :user_type)
    end

    def get_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end

    def secure_conversation
      if current_user
        user = current_user.id
      end
      if current_host
        user = current_host.id
      end

      if user != @conversation.sender_id && current_user_id != @conversation.recipient_id
        redirect_to root_path

      end
    end
end
