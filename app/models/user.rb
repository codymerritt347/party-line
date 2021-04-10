class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_many :messages
  has_many :tasks, through: :parties
  has_many :replies

  validates :first_name, presence: true
  # validates :first_name, format { without: /[0-9]/, message: "First name cannot contain any numbers"}
  validates :last_name, presence: true
  # validates :last_name, format { without: /[0-9]/, message: "Last name cannot contain any numbers"}
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { in: 6..20 }, message: "Password must contain 6-20 characters"

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end

end
