class QuestionsSidebarPresenter
  def users
    @users ||= User.signed_up
  end

  def categories
    @categories ||= Category.sorted_by_name
  end
end
