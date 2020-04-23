class Chat < ActiveRecord::Base
    has_many :chat_users
    has_many :users, through: :chat_users, source: :user
    has_many :messages
end
