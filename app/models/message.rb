class Message < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :replies

  validates :content, { presence: true }
end
