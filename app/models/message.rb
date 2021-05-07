class Message < ApplicationRecord
  belongs_to :party
  belongs_to :sender, :class_name => "User"

  validates :content, { presence: true }

  scope :urgent, -> { where("urgent = true") }
  scope :today, -> { where(updated_at: 24.hours.ago..Time.now) }
  
end
