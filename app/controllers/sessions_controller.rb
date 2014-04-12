class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id]  = user.id
      redirect_to admin_url, notice: "Logged in!"
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end   

  def destroy
    session[:user_id] = nil
    redirect_to restaurant_url, notice: "Logged out"
  end
end
