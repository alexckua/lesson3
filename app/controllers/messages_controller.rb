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
    p params
    @message = Message.find(params[:id])
    #@message = message
    #@message.update_attributes(message_params)
    #redirect_to root_path
  end

  def update
    @message = Message.find(params[:id])
    if @message.update_attributes(message_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    message.destroy
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
