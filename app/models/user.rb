class User < ApplicationRecord
  has_many :statuses, dependent: :destroy
  accepts_nested_attributes_for :statuses
  has_many :user_parties, dependent: :destroy
  has_many :parties, through: :user_parties
  has_many :messages, through: :parties
  
  has_secure_password

  validates :email, {
    uniqueness: true,
    format: {  
      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  
    }
  }

  scope :order_by_last_name, -> { order(last_name: :asc) }
  scope :everyone_else, ->(user) { where.not("id = ?", user.id) }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.create_from_omniauth(auth)
    self.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
      u.first_name = auth[:info][:first_name]
      u.last_name = auth[:info][:last_name]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex(16)
    end
  end

end
