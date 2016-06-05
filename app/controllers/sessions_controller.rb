class SessionsController < ApplicationController

  def home
  end

  def new
    redirect_to users_path if logged_in?
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])
    if !@user
      redirect_to signin_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
