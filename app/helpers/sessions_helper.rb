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

  def require_token
    respond_to do |format|
      format.json {
        authenticate_token || render_unauthorized("Access denied")
      }
      format.html { }
    end
  end

  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user ||= User.find_by(token: token)
    end
  end
end
