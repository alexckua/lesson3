class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)

    if @message.valid?
      message = 'Message has been added'
    else
      message = @message.errors.full_messages.to_sentence
    end
  end

  def like
    message.increment!(:likes)
  end

  def dislike
    # TODO
  end

  private

  def message
    @message ||= Message.find(params[:id])
  end
  helper_method :message

  def message_params
    params.require(:message).permit(:text)
  end

end
