class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:userid] = @user.id
      redirect_to user_path(current_user)
    else
      flash[:loginerror] = 'Login Failed Please Retry'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
