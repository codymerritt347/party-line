class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_many :messages
  has_many :tasks, through: :parties
  has_many :replies

  validates :first_name, {presence: true }
  validates :last_name, { presence: true }
  validates :email, {
    presence: true,
    uniqueness: true
  }
  validates :password, {
    presence: true,
    length: {
      minimum: 6,
      maximum: 19,
      too_short: "Password must be longer 5 characters",
      too_long: "Password must be shorter than 20 characters"
    }
  }

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end

end
