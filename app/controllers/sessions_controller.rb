class SessionsController < ApplicationController

  def new
    if current_user
      login(current_user)
      flash[:success] = "#{current_user.name}, you are already logged in!"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login(user)
    else
      flash[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have been logged out"
    redirect_to '/'
  end

  private

  def login(user)
    redirect_to '/dashboard'
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.name}, you are logged in!"
  end

end
