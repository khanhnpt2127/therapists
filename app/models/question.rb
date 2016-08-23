class Question < ApplicationRecord
  belongs_to :survey, inverse_of: :questions
  has_many :answers,dependent: :destroy, inverse_of: :question
  accepts_nested_attributes_for :answers
end
