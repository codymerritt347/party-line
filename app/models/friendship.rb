class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :user, :foreign_key => :friend_id
  
end