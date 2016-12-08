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
      email = ActivationMailer.activation_email(@user)
      email.deliver
      flash[:messages] = ["Check your email for an activation code"]
      redirect_to new_session_url
    else
      flash.now[:messages] = @user.errors.full_messages
      render :new
    end
  end

  def activate
    user = User.find_by(activation_token: params[:activation_token])
    if user
      user.toggle(:activated)
      login(user)
      flash[:messages] = ["Account activation successful"]
      redirect_to bands_url
    else
      redirect_to new_session_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
