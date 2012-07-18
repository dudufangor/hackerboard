class AdminController < ApplicationController
	before_filter :authorize_user

	private

	def authorize_user
		authenticate_or_request_with_http_digest("Hackerboard Admin") do |user, password|
			logged_in? && current_user.email == user
		end
	end
end