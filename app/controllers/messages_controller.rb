class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
  end

  def vote
    message.vote(params[:vote], current_user)
  end

  def edit
  end

  def update
    message.update_attributes(message_params)
  end

  def destroy
    message.destroy if is_my_message?(message)
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
