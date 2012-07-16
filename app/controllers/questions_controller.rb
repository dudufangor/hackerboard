class QuestionsController < ApplicationController
  require_logged_user :only => [:new, :create]

  helper_method :categories

  def index
    @questions = QuestionFilter.filter(params)
  end

  def search
    @questions = QuestionSearch.search(params)
  end

  def show
    @question = Question.find(params[:id])
    @reply = Reply.new
    @reply_form = ReplyFormPresenter.new(current_user, @question, @reply)
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(params[:question])

    if @question.save
      redirect_to question_path(@question), :notice => t("flash.questions.create.notice")
    else
      render :new
    end
  end

  private
  def categories
    @categories ||= Category.scoped
  end
end
