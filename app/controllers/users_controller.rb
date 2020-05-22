class UsersController < ApplicationController
  # before_action :set_work, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @user = User.all
  end

  def show
    @user= current_user
    if @user.nil?
      redirect_to users_path
      return
    end

  end


  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{username}"
    else
      user = User.create(username: username)
      session[:user_id] = user.id
      flash[:success] = "Welcome #{username}"
    end

    session[:username] = user.username

    redirect_to root_path
    return
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
    return
  end

  def current
    @current_user = User.find_by(id: session[:user_id])
    unless @current_user
      flash[:error] = "You must be logged in to see this page"
      redirect_to root_path
      return
    end
  end
end
