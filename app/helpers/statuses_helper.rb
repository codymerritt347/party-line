module StatusesHelper

  def no_statuses?(user)
    if user.statuses.empty?
      true
    else
      false
    end
  end

end
