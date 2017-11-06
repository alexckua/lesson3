class Message < ApplicationRecord
	include Gravtastic
  gravtastic
  belongs_to :user
  validates :text, presence: true

  def user_name
    user&.name || 'Hron'
  end
end
