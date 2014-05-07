class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user and user.authenticate(params[:password])
      session[:user_id]  = user.id
      redirect_to restaurant_url
    else
      redirect_to login_url, notice: "Invalid user/password combination"
    end
  end   

  def destroy
    session[:user_id] = nil
    redirect_to restaurant_url, notice: "Logged out"
  end
end
