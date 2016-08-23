class Survey < ApplicationRecord
  has_many :questions, :dependent => :destroy, inverse_of: :survey
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
end
