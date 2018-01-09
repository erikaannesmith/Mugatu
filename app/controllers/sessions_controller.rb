class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider].present?
      check_user = User.where(username: request.env['omniauth.auth']["info"]["name"]).first
      if check_user.nil?
        user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        redirect_to edit_user_path(user)
      else
        user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        if current_designer?
          redirect_to designer_dashboard_path(user)
          flash[:success] = "Successfully logged in as a designer"
        elsif current_producer?
          redirect_to producer_dashboard_path(user)
          flash[:success] = "Successfully logged in as a producer"
        end
      end
    else
      hand_roll_login
    end
  end

  def hand_roll_login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if current_admin?
        redirect_to admin_dashboard_path(user)
        flash[:success] = "Successfully logged in as an administrator"
      elsif current_designer?
        redirect_to designer_dashboard_path(user)
        flash[:success] = "Successfully logged in as a designer"
      elsif current_producer?
        redirect_to producer_dashboard_path(user)
        flash[:success] = "Successfully logged in as a producer"
      end
    else
      redirect_to login_path
      flash[:error] = "Login credentials are incorrect, please try again or create an account!"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  

end