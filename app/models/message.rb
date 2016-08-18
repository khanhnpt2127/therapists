class Message < ApplicationRecord
  belongs_to :user, polymorphic: true
  belongs_to :conversation
  scope :unread, -> { where(read_at: nil) }

  validates :user, :conversation, :body, presence: true

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

  def survey_name
    case user
    when User
      user.survey.name
    when Host
      ''
    else
      raise "who are you??"
    end
  end
end
