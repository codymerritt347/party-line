class User < ApplicationRecord
  has_secure_password

  has_many :statuses, dependent: :destroy
  accepts_nested_attributes_for :statuses

  has_many :user_parties, dependent: :destroy
  has_many :parties, through: :user_parties

  has_many :messages, through: :parties

  validates :screen_name, {
    uniqueness: true,
    length: {
      minimum: 8,
      maximum: 15,
      message: "must contain 8-15 characters"
    }
  }
  validates :email, {
    uniqueness: true,
    format: {  
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
    }
  }
  
end
