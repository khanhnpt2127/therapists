class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  has_many :reviews, as: :reviewable 
  belongs_to :user, polymorphic: true
end
