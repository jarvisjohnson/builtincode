class ClientMailer < ApplicationMailer
  def new_message_received(message, support_conversation)
    @message = message
    @convo = support_conversation
    @sender = Client.find(@message.client_id)
    @receiver = @convo.with(@sender)

    mail(to: @receiver.email, subject: "New message on Built in Code")
  end
end