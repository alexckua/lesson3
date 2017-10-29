class User < ApplicationRecord
  validates :name, presence: { message: 'should be defined' }
  validates :email, presence: { message: 'should be defined' }, uniqueness: {message: 'should be unique!'}
  has_many :messages, dependent: :destroy
  has_secure_token
end
