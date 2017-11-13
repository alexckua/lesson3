class Message < ApplicationRecord
  include Gravtastic
  gravtastic
  belongs_to :user
  has_many :votes, dependent: :delete_all
  has_many :likes, -> { like }, class_name: 'Vote'
  has_many :dislikes, -> { dislike }, class_name: 'Vote'
  validates :text, presence: true

  scope :chat, -> (q, page) { search(q).includes(:user).order(created_at: :asc).page(page) }
  scope :search, -> (q) { where("text ILIKE ?", "%#{q}%") }

  def user_name
    user&.name
  end

  def vote(action, user)
    vote = votes.where(user: user).first_or_initialize
    if vote.persisted? && vote.vote == action
      vote.delete
    else
      vote.assign_attributes(vote: action)
      vote.save
    end
    update(likes_count: likes.count, dislikes_count: dislikes.count)
  end
end
