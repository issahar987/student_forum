module SessionsHelper
  def log_in(user)
  session[:ID_User] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:ID_User])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:ID_User)
    @current_user = nil
  end
end
