class QuestionsSidebarPresenter
	def users
		@user ||= User.signed_up
	end

	def categories
		@categories ||= Category.sorted_by_name
	end
end