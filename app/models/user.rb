class User < ApplicationRecord
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :books, dependent: :destroy
  def received_messages
    where(recipient: self)
  end

  def self.sent_messages
    where(sender: self)
  end

  def latest_received_messages(n)
    received_messages.order(created_at: :desc).limit(n)
  end

  def unread_messages
    received_messages.unread
  end
end
