class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
  end

  def like
    message.increment!(:likes)
  end

  def dislike
    message.increment!(:dislikes)
  end

  def edit
  end

  def update
    message.update_attributes(message_params)
  end

  def destroy
    if is_my_message?(message)
      message.destroy
    else
      redirect_to chat_path,  notice: 'Haha. Nothing you can not do.Cunning Ass'
    end
  end

  private

  def message
    @message ||= current_user.messages.find(params[:id])
  end
  helper_method :message

  def message_params
    params.require(:message).permit(:text)
  end
end
