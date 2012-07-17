class QuestionsController < ApplicationController
  require_logged_user :only => [:new, :create]

  helper_method :categories

  rescue_from Riddle::ConnectionError do
    redirect_to root_path, :alert => t("flash.questions.search.alert")
  end

  rescue_from ActiveRecord::RecordNotFound do
    case request.format.symbol
    when :html
      render :file => Rails.root.join("public/404.html"), :status => 404
    when :json
      render :json=>{:error => "Question not found"}, :status => 404
    end
  end

  def index
    @questions = QuestionFilter.filter(params)
    @sidebar = QuestionsSidebarPresenter.new
  end

  def search
    @questions = QuestionSearch.search(params)
  end

  def show
    @question = Question.find(params[:id])
    @reply = Reply.new
    @reply_form = ReplyFormPresenter.new(current_user, @question, @reply)
    @question.viewed!
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
