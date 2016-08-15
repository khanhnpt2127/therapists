class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  scope :unread, -> { where(read_at: nil) }

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def mark_as_read!
    self.read_at = Time.now
    save!
  end

  def read?
    read_at
  end

end
