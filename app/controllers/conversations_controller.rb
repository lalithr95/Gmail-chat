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
  end

  private
  def conversation_params
  	params.permit(:sender_id, :recipient_id)
  end

end
