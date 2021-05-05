class Status < ApplicationRecord
  belongs_to :user
  
  validates :content, { 
    presence: true,
    length: {
      minimum: 1,
      maximum: 281,
      message: "must contain 1-281 characters"
    }
  }

  scope :my_statuses, ->(user) { where("user_id = ?", user.id) }

end
