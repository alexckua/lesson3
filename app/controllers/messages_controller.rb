class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)

    if @message.valid?
      message = 'Message has been added'
    else
      message = @message.errors.full_messages.to_sentence
    end

    redirect_to chat_path, notice: message
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

end
