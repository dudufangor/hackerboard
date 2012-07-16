class ReplyFormPresenter
  def initialize(user, question, reply)
    @user = user
    @question = question
    @reply = reply
  end

  def partial
    if @user
      {
        :partial => "replies/form",
        :locals => {:question => @question, :reply => @reply}
      }
    else
      {:partial => "replies/require_login"}
    end
  end
end
