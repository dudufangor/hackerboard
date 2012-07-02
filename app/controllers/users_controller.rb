class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.create(params[:user])
		flash[:notice] = t("flash.users.create.notice")
		redirect_to login_path
	end
end
