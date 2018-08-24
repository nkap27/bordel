class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @event_hash = {}
    @user.events.each do |event|
      @event_hash[event.id] = event
    end
  end

  # def profile
  # add before_action :profile
  #   redirect_to user_path(@user)
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:notice] = "Signup successful! Bienvenue, #{@user.name}."
      session[:user_id] = @user.id
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.valid?
      flash[:notice] = "You have successfully updated your profile."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :name, :muse, :bio, :password)
    end

end
