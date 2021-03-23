class UsersController < ApplicationController
  def show
    if not logged_in?
      redirect_to login_path, alert: "You need to log in first."
    end
  end

  def new
  end

  def create
    # binding.pry
    # params[:user][:password_confirmation] = nil if params[:user][:password_confirmation].empty?

    user = User.create(user_params)
    if user.id
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to signup_path, alert: user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
