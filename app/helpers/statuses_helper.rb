module StatusesHelper

  def ago(status)
    time_ago_in_words(status.updated_at)
  end

end
