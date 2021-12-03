class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    if params[:username].present?
      @user = User.find_or_create_by(username: params[:username], email: "user@user.com")
      if @user.username == 'lita'
        redirect_to login_path, flash[:notice] =  {'用户名': ["lita是机器人，请换个名字"]}
      else
        session[:user_id] = @user.id
        session[:user_email] = @user.email
        redirect_to chats_path
      end
    else
      @user = User.new
    end
  end

  def create
    user = User.find_or_create_by(username: params[:username], email: "user@user.com")
    if user
      if user.username == 'lita'
        redirect_to login_path, flash[:notice] =  {'用户名': ["lita是机器人，请换个名字"]}
      else
        session[:user_id] = user.id
        session[:user_email] = user.email
        redirect_to chats_path
      end
    else
      redirect_to login_path, flash[:notice] =  {'用户名': ["doesn't exist"]}
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
    def user_params
      params.permit(:username)
    end
end
