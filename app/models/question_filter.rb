class QuestionFilter
  UNANSWERED = "unanswered"

  def self.filter(options = {})
    scope = Question.recent.includes(:user, :category)
    scope = scope.paginate(options[:page])
    scope = scope.unanswered if options[:filter] == UNANSWERED
    scope
  end
end
