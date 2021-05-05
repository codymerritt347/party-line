class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties
  has_many :messages, dependent: :destroy
  
  validates :name, { presence: true }
  
  scope :one_on_one, -> { where("users.count == 2") }
  
end