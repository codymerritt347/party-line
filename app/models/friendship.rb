class Friendship < ApplicationRecord
  belongs_to :user, :foreign_key => :friend_id
  after_create do |p|
    if !Friendship.find(:first, :conditions => { :friend_id => p.user_id })
      Friendship.create!(:user_id => p.friend_id, :friend_id => p.user_id)
    end
  end
  after_destroy do |p|
    reciprocal = Friend.find(:first, :conditions => { :friend_id => p.user_id })
    reciprocal.destroy unless reciprocal.nil?
  end
end