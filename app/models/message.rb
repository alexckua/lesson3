class Message < ApplicationRecord
  include Gravtastic
  gravtastic
  belongs_to :user
  has_many :votes
  validates :text, presence: true

  def user_name
    user&.name
  end

  def vote(params, current_user)
    if params[:like]
      self.increment!(:likes)
      self.votes.create(user_id: current_user.id, vote: :like)
    elsif params[:dislike]
      self.increment!(:dislikes)
      self.votes.create(user_id: current_user.id, vote: :dislike)
    end
  end

  def change_vote(params, vote)
    if params[:like]
      case vote.vote
        when 'like' then
          vote.update(vote: :no_vote)
          self.decrement!(:likes)
        when 'dislike' then
          vote.update(vote: :like)
          self.decrement!(:dislikes)
          self.increment!(:likes)
        when 'no_vote' then
          vote.update(vote: :like)
          self.increment!(:likes)
      end
    elsif params[:dislike]
      case vote.vote
        when 'like' then
          vote.update(vote: :dislike)
          self.decrement!(:likes)
          self.increment!(:dislikes)
        when 'dislike' then
          vote.update(vote: :no_vote)
          self.decrement!(:dislikes)
        when 'no_vote' then
          vote.update(vote: :dislike)
          self.increment!(:dislikes)
      end
    end
  end
end
