class Party < ApplicationRecord
  has_many :user_parties, :dependent => :destroy
  has_many :users, through: :user_parties, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  validates :name, { presence: true }
end
