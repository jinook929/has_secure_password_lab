class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, alert: "Log in failed..."
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
