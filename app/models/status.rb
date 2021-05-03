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
  
  def hours_ago
    time_diff = Time.current - self.created_at
    minute_diff = time_diff / 60
    hour_diff = minute_diff / 60
    rounded_diff = hour_diff.round
    if rounded_diff == 1
      "#{rounded_diff} hour ago"
    else
      "#{rounded_diff} hours ago"
    end
  end

end
