class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_that_user_signed_in
    if session[:user_id].nil? then
      redirect_to session_sign_in_path
    end
  end
  
  def check_that_user_is_administrator
    if session[:user_id].nil? then
      redirect_to session_sign_in_path
    else
      user = User.find(session[:user_id])
      if user.nil? or user.level < 2 then
        redirect_to root_path,
                    :notice => 'Requires administrator access'
      end
    end
  end
  
end
