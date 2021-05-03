class Status < ApplicationRecord
  belongs_to :user

  validates :content, { 
    presence: true,
    length: {
      minimum: 1,
      maximum: 281,
      message: "Must contain 1-281 characters!"
    }
  }
  
end
