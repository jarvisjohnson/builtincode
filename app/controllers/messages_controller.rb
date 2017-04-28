class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    @message = current_client.messages.build
  end

  def create
    @support_conversation ||= SupportConversation.create(author_id: current_client.uuid, 
                                                          receiver_id: @receiver.uuid)

    @message = current_client.messages.build(message_params)
    @message.support_conversation_id = @support_conversation.id
    @message.save!

    flash[:success] = "Your message was sent!"
    redirect_to support_conversation_path(@support_conversation)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def find_conversation!
    if params[:receiver_id]
      @receiver = Client.find(params[:receiver_id])
      redirect_to(dashboard_index_path) and return unless @receiver
      @support_conversation = SupportConversation.between(current_client.uuid, @receiver.uuid)[0]
    else
      @support_conversation = SupportConversation.find(params[:support_conversation_id])
      redirect_to(dashboard_index_path) and return unless @support_conversation && @support_conversation.participates?(current_client)      
    end
  end
end