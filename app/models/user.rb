class User < ActiveRecord::Base
  has_secure_password
  has_many :chat_users
  has_many :chats, through: :chat_users
  has_many :messages
end
