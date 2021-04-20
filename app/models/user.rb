class User < ApplicationRecord
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :source => :user
  has_many :statuses, :dependent => :destroy
  accepts_nested_attributes_for :statuses
  has_many :user_parties, :dependent => :destroy
  has_many :parties, through: :user_parties, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :replies, :dependent => :destroy

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

  before_create :make_title_case
  # after_create :email_new_user

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def make_title_case
    self.first_name = self.first_name.titlecase
    self.last_name = self.last_name.titlecase
  end

  def email_new_user
    # https://guides.rubyonrails.org/action_mailer_basics.html
  end

end
