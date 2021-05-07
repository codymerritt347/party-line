class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties
  has_many :messages
  
  validates :name, { presence: true }
  
  scope :one_on_one, -> { where("users.count == 2") }
  
end