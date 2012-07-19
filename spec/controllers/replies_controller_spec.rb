require "spec_helper"

describe RepliesController do
  describe "POST :create" do
    context "when unlogged" do
      it "redirects to the login page" do
        expect {
          post :create, :question_id => 1234
        }.to_not raise_error

        response.should redirect_to(login_path)
      end
    end

    context "when logged" do
      let(:user) { mock_model(User) }
      let(:question) { mock_model(Question) }
      let(:reply) { Reply.new }

      before do
        reply.stub :save => true
        controller.stub_chain(:current_user, :replies, :new => reply)
        Question.stub :find => question
      end

      it "redirects to the question page" do
        post :create, :question_id => question.id
        response.should redirect_to(question_path(question))
      end
    end
  end
end
