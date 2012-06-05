class SessionController < ApplicationController
  def sign_in
    entered_email = params[:entered_email]
    if not entered_email.nil? then
      user = User.find_by_email(entered_email)
      if user && user.authenticate(params[:entered_password]) then 
        session[:user_id] = user.id
        session[:list_id] = nil
        if user.list then
          session[:list_id] = user.list.id
        end
        redirect_to root_path
      else
        redirect_to session_sign_in_path, :alert => 'That email address and password are not recognized.'
      end
    end
    # If we get here, Rails automatically renders the view at
    # app/views/session/sign_in.html.erb.  
  end
  
  def sign_out
    session[:user_id] = nil
    session[:list_id] = nil
  end
end