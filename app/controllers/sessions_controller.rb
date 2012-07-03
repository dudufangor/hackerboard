class SessionsController < ApplicationController
	def new
	end

	def create
		reset_session

		user = Authenticator.authenticate(params[:email], params[:password])

		if user
			session[:user_id] = user.id
			flash[:notice] = t("flash.sessions.create.notice")
			redirect_to root_path
		else
			flash[:alert] = t("flash.sessions.create.alert")
			render :new
		end
	end
end
