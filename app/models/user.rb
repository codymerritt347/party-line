class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :messages
  has_many :plans, through: :groups
  has_many :replies
end
