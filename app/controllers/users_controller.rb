class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  
  def index
  end

  def new
  end

  def show
    
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:userid] = @user.id
      redirect_to user_path(@user)
    else
      puts 'bad user'
      redirect_to login_path
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:users).permit(:name,:email,:password,:password_confirmation)
  end

end
