class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:provider].present?
      check_user = User.where(username: request.env['omniauth.auth']["info"]["email"]).first
      if check_user.nil?
        user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        redirect_to edit_user_path(user)
      else
        user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        if current_designer?
          redirect_to designer_dashboard_path(user)
        elsif current_producer?
          redirect_to producer_dashboard_path(user)
        end
        flash[:success] = "Welcome, #{current_user.username}!"
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
      elsif current_designer?
        redirect_to designer_dashboard_path(user)
      elsif current_producer?
        redirect_to producer_dashboard_path(user)
      end
      flash[:success] = "Welcome, #{current_user.username.capitalize}!"
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