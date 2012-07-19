class FeedController < ApplicationController
  before_filter do
    request.format = :xml
  end

  def replies
    @question = Question.find(params[:id])
    @replies = @question.replies.to_feed

    render :feed
  end

  def questions
    @questions = Question.to_feed

    render :feed
  end

  def category
    @category = Category.find(params[:id])
    @questions = @category.questions.to_feed

    render :feed
  end
end
