class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(params[:user])

		if @user.save
			flash[:notice] = t("flash.users.create.notice")
			redirect_to login_path
		else
			render :new
		end
	end
end
