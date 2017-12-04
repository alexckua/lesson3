class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
    ChatUpdateJob.perform_later('create', @message)
  end

  def vote
    message.vote(params[:vote], current_user)
    ChatUpdateJob.perform_later('vote', [@message, current_user])
  end

  def update
    message.update_attributes(message_params)
    ChatUpdateJob.perform_later('update', @message)
  end

  def destroy
    current_user.messages.find(params[:id]).destroy
    ChatUpdateJob.perform_later('destroy', params[:id])
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
