class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  has_many :messages
  has_many :tasks

  validates :name, { presence: true }
end
