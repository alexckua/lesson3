class Vote < ApplicationRecord
  enum vote: { like: 1, dislike: 2, no_vote: 3 }
  belongs_to :user
  belongs_to :message
  validates :user_id, uniqueness: { scope: :message_id }
end
