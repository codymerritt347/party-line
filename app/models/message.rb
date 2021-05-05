class Message < ApplicationRecord
  belongs_to :party

  validates :content, { presence: true }
end
