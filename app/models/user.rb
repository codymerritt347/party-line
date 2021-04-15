class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_many :messages
  has_many :tasks, through: :parties
  has_many :replies

  validates :first_name, {
    presence: true,
    format: {
      without: /[0-9]/,
      message: "does not allow numbers"
    }
  }
  validates :last_name, {
    presence: true,
    format: {
      without: /[0-9]/,
      message: "does not allow numbers"
    }
  }
  validates :email, {
    presence: true,
    uniqueness: true
  }
  validates :password, {
    presence: true,
    length: {
      minimum: 6,
      maximum: 20,
      message: "must contain 6-20 characters"
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
