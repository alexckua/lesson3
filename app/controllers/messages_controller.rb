class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
    render :create
    ChatUpdateJob.perform_later(@message)
  end

  def vote
    message.vote(params[:vote], current_user)
    render :vote
    ActionCable.server.broadcast 'chat', user_id: @message.user_id, id: @message.id, action: :vote, res: render_to_string(template: 'messages/vote', object: @message)
  end

  def update
    message.update_attributes(message_params)
  end

  def destroy
    current_user.messages.find(params[:id]).destroy
    ActionCable.server.broadcast 'chat', id: params[:id], action: :delete
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
