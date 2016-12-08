class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      flash[:messages] = ["Stop snoopin"]
      redirect_to root_url
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:messages] = ["Welcome to RecordLablr, #{@user.username}!"]
      redirect_to user_url(@user)
    else
      flash.now[:messages] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
