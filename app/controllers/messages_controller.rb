class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
    #p params
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
    message.increment!(:dislikes)
  end

  def edit
    #p params
    @message = message
  end

  def update
    @message = message
    if is_my_message?(message)
      if @message.update_attributes(message_params)
        redirect_to root_path
      else
        render 'edit'
      end
    else
      redirect_to chat_path,  notice: 'Haha. Nothing you can not do.Cunning Ass'
    end
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
    @message ||= Message.find(params[:id])
  end
  helper_method :message

  def message_params
    params.require(:message).permit(:text)
  end
end
