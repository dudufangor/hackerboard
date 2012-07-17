class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    signup = Signup.new(@user, login_url)

    if signup.complete
      flash[:notice] = t("flash.users.create.notice")
      redirect_to login_path
    else
      render :new
    end
  end

  def show
    
  end
end
