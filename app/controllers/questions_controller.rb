class QuestionsController < ApplicationController
	require_logged_user :only => [:new, :create]
	helper_method :categories

	def index
	end

	def new
		@question = Question.new
	end

	def create
		@question = current_user.questions.new(params[:question])

		if @question.save
			notic_path = "flash.questions.create.notice"
			redirect_to question_path(@question), :notice => t(notic_path)
		else
			render :new
	  end
	end

	def show
	@question = Question.find(params[:id])
	end

	private
	def categories
		@categories ||= Category.scoped
	end
end
