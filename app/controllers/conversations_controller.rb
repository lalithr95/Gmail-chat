class ConversationsController < ApplicationController
  before_action :authenticate_user!

  layout false

  def create
  	if Conversation.between(params[:sender_id], params[:recipient_id]).present?
  		@conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  	else
  		@conversation = Conversation.create!(conversation_params)
  	end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = Conversation.messages
    @message = Message.new
  end

  private
  def conversation_params
  	params.permit(:sender_id, :recipient_id)
  end

  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
