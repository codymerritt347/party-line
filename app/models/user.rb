class User < ApplicationRecord
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :user
  has_many :statuses, :dependent => :destroy
  has_many :user_parties, :dependent => :destroy
  has_many :parties, through: :user_parties, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  accepts_nested_attributes_for :statuses

  has_secure_password

  validates :screen_name, {
    presence: true,
    uniqueness: true,
    length: {
      minimum: 8,
      maximum: 15,
      message: "must contain 8-15 characters"
    }
  }
  validates :email, {
    presence: true,
    uniqueness: true,
    format: {  
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
    }
  }
  validates :password, {
    presence: true,
    length: {
      minimum: 6,
      maximum: 20,
      message: "must contain 6-20 characters"
    }
  }

  private

end
