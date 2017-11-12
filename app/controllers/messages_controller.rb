class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
  end

  def vote
    vote = Vote.where(user_id: current_user.id, message_id: message.id)
    if vote.count.zero?
      message.vote(params, current_user)
    else
      message.change_vote(params, vote.first)
    end
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
