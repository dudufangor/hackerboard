class	QuestionFilter
	UNANSWERED = "unanswered"

	def self.filter(filter)
		scope = Question.recent.includes(:user, :category)
		scope = scope.unanswered if filter == UNANSWERED
		scope
	end
end