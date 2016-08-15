class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'Host'
  scope :unread, -> { where(read_at: nil) }
  def mark_as_read!
    self.read_at = Time.now
    save!
  end

  def read?
    read_at
  end
  
end
