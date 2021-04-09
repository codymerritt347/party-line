class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :messages
  has_many :plans, through: :groups
  has_many :replies

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    else
      self.first_name
    end
  end

end
