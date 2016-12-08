class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(session_params[:email],
                                    session_params[:password]
                                   )
    if user
      login(user)
      flash[:messages] = ["Welcome back, #{user.username}"]
      redirect_to user_url(user)
    else
      flash.now[:messages] = ["Invalid login"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  private

  def session_params
    params.require(:sessions).permit(:email, :password)
  end
end
