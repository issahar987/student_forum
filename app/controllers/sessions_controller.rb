class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def new
  end

  def create
    # user = User.find_by(login: params[:session][:login])
    # if user && user.authenticate(params[:session][:password])
    #   # Wszystko dobrze, logujemy
    #   log_in user
    #   redirect_to user
    # else
    #   # Niedobrze
    #   render 'new'
    # end
    respond_to do |format|
      user = User.find_by(login: params[:session][:login])
      if user && user.authenticate(params[:session][:password])
        format.html do
          log_in user
          redirect_to user
        end
        format.json do
          user.password = params[:session][:password]
          user.regenerate_token
          render json: { token: user.token }
        end
      else
        format.html do
          render 'new'
      end
      format.json do
        render json: { message: 'Niepoprawne dane' }
      end
    end
  end
end
  
  def destroy
    log_out
    redirect_to root_url
  end


end
