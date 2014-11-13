class Status < ActiveRecord::Base
  validates :description, presence: true
  validates :user, presence: true
  validates :number_of_likes, presence: true
  
end
