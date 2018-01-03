class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if current_admin?
        redirect_to admin_dashboard_path(user)
        flash[:notice] = "Successfully logged in as an administrator"
      elsif current_designer?
        redirect_to designer_dashboard_path(user)
        flash[:notice] = "Successfully logged in as a designer"
      elsif current_producer?
        redirect_to producer_dashboard_path(user)
        flash[:notice] = "Successfully logged in as a producer"
      end
    else
      redirect_to login_path
      flash[:notice] = "Login credentials are incorrect, please try again or create an account!"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end