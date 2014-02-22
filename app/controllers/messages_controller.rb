class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end

   def create
   	#Gems DSL syntax for creating a new message. 
    # current_user.send_message(User.find_by_id(1), "Message topic", "I am the one who knocks!")
    @message = Message.new(message_params)
	@message.sent_messageable_type = 'User'
	@message.received_messageable_type = 'User'
    
    respond_to do |format|
      if @message.save
        format.json { render json: @message.to_json }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

    private

    def message_params
      params.require(:message).permit(:topic,:body,:sent_messageable_id,:received_messageable_id)
    end
end
