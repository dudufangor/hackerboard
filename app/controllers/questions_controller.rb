class QuestionsController < ApplicationController
	def index
	end

	def new
		@question = Question.new
		@categories = Category.scoped
	end
end
