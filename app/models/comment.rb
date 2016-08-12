class Comment < ApplicationRecord
  belongs_to :host
  validates :host_id, presence: true
  belongs_to :user
end
