class SessionsController < ApplicationController
  skip_before_action :authorized, except: :destroy

  def new
    render :new
  end

  def create
    @user = User.find_by({ username: params[:username]})
    if !!@user && @user.authenticate(params[:password])
      flash[:notice] = 'Welcome back! Re-bienvenue!'
      session[:user_id] = @user.id
      redirect_to events_path
    else
      flash[:notice] = 'Invalid username or password!'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end #controller end
