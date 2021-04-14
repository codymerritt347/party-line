class Task < ApplicationRecord
  belongs_to :party

  validates :title, { presence: true }
  validates :description, { presence: true }
end
