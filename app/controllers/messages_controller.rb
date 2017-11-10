class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(message_params)
  end

  def vote
    vote = Vote.where(user_id: current_user.id, message_id: message.id)
    if vote.count.zero?
      if params[:like]
        message.increment!(:likes)
        message.votes.create(user_id: current_user.id, vote: :like)
      elsif params[:dislike]
        message.increment!(:dislikes)
        message.votes.create(user_id: current_user.id, vote: :dislike)
      end
    else
      change_vote(vote.first, message)
    end
  end

  def change_vote(vote, message)
    if params[:like]
      case vote.vote
        when 'like' then
          vote.update(vote: :no_vote)
          message.decrement!(:likes)
        when 'dislike' then
          vote.update(vote: :like)
          message.decrement!(:dislikes)
          message.increment!(:likes)
        when 'no_vote' then
          vote.update(vote: :like)
          message.increment!(:likes)
      end
    elsif params[:dislike]
      case vote.vote
        when 'like' then
          vote.update(vote: :dislike)
          message.decrement!(:likes)
          message.increment!(:dislikes)
        when 'dislike' then
          vote.update(vote: :no_vote)
          message.decrement!(:dislikes)
        when 'no_vote' then
          vote.update(vote: :dislike)
          message.increment!(:dislikes)
      end
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
    @message ||= current_user.messages.find(params[:id])
  end
  helper_method :message

  def message_params
    params.require(:message).permit(:text)
  end
end
