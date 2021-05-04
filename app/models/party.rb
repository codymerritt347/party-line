class Party < ApplicationRecord
  has_many :user_parties, dependent: :destroy
  has_many :users, through: :user_parties
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :users

  validates :name, { presence: true }
end