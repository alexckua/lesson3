class Message < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  def create
  end
end
