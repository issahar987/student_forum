class SessionsController < ApplicationController

  swagger_controller :session, "Authentication"

  def new
  end


  swagger_api :create do
    summary "Gather a token"
    param :form, "session[login]", :string, :required, "User login"
    param :form, "session[password]", :string, :required, "User password"
  end
  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      # Wszystko dobrze, logujemy
      log_in user
      redirect_to user
    else
      # Niedobrze
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
