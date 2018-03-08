class UsersController < ApplicationController

  def new
    @users = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to MusicApp"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @users.errors.full_messages
      render :new
  end

  def show
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
