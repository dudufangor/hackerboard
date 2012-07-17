class QuestionsSidebarPresenter
	def users
		@user ||= User.recent
	end

	def categories
		@categories ||= Category.sorted_by_name
	end
end