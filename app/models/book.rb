class Book < ApplicationRecord
  belongs_to :user
  belongs_to :host
 

  def self.delete_expired_books 
    if (Book.where("start_at < ?", Time.current-7.days))
      Book.where("start_at < ?" , Time.current-7.days).destroy_all
      Book.where("start_at > ?", Time.current-7.days)
    end
  end

 
end
