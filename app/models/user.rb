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
  validates :is_title_case

  before_validation :make_title_case

  # before_save :email_new_user

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end

  private

  def is_title_case
    if first_name.split.any?{|w|w[0].upcase != w[0]} && last_name.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Name must be in title case")
    end
  end

  def make_title_case
    self.first_name = self.first_name.titlecase
    self.last_name = self.last_name.titlecase
  end

  def email_new_user
    # https://guides.rubyonrails.org/action_mailer_basics.html
  end

end
