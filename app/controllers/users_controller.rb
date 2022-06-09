class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  swagger_controller :users, 'Users'

  # GET /users or /users.json
  swagger_api :index do
    summary 'Returns all users'
    notes 'Notes...'
  end
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  swagger_api :show do
    summary 'Returns one user'
    param :path, :id, :integer, :required, "User id"
    notes 'Notes...'
  end
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  swagger_api :create do
  summary "Create a user"
  param :form, "user[name]", :string, :required, "User name"
  param :form, "user[nickName]", :string, :required, "User nickName"
  param :form, "user[login]", :string, :required, "User login"
  param :form, "user[eMail]", :string, :required, "User eMail"
  param :form, "user[password]", :string, :required, "User password"
  param :form, "user[phoneNumber]", :string, :required, "User phoneNumber"
end
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:nickName, :name, :eMail, :phoneNumber, :login, :password, :password_confirmation)
    end
end
