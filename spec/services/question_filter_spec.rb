require "spec_helper"

describe QuestionFilter do
  let(:user) { users(:john) }
  let(:question) { questions(:about_rails) }
  let(:category) { categories(:ruby) }

  let!(:reply) {
    question.replies.create!(:body => "My reply", :user_id => user.id)
  }

  let!(:another_question) {
    FactoryGirl.create(:question, :user => user, :category => category)
  }

  context "when no filter is provided" do
    subject { QuestionFilter.filter(:filter => nil).all }
    it { should have(2).items }
  end

  context "when filtering by unanswered" do
    subject { QuestionFilter.filter(:filter => QuestionFilter::UNANSWERED).all }

    it { should have(1).item }

    it "returns correct records" do
      subject.first.should eql(another_question)
    end
  end
end
