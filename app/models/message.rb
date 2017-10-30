class Message < ApplicationRecord
  belongs_to :user
  validates :text, presence: true

  def user_name
    user&.name || 'Hron'
  end
end
