module ApplicationHelper
  
  def display_email(user_id)
    user = User.find(user_id)
    if user then user.email else "Unknown" end
  end
  
  def administrator_signed_in?
    if session[:user_id] then
      user = User.find(session[:user_id])
      user and user.level > 1
    else
      false
    end
  end
  
end
