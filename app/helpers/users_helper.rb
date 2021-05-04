module UsersHelper
  
  def everyone_else(user)
    User.where.not("id=#{user.id}")
  end

end
