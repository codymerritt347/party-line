class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  has_many :messages

  validates :name, { presence: true }
end
