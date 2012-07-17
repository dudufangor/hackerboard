class FeedController < ApplicationController
	before_filter do
		request.format = :xml
	end

	def replies
		@question = Question.find(params[:id])
		@replies = @questions.replies.include(:user)
		render :feed
	end
	
	def questions
	end

	def category
	end
end