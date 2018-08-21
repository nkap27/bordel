class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = @user.create()
  end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end

  private

    def set_user
      @user = User.find_by_id(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :name, :muse, :bio)
    end

end
