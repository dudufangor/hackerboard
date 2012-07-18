class SessionsController < ApplicationController
  layout "window"

  def new
  end

  def create
    reset_session

    user = Authenticator.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => t("flash.sessions.create.notice")
    else
      flash.now[:alert] = t("flash.sessions.create.alert")
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
