class Message < ApplicationRecord
  belongs_to :party

  validates :content, { presence: true }

  scope :urgent, -> { where("urgent = true") }
  scope :today, -> { where(updated_at: 24.hours.ago..Time.now) }
  
end
