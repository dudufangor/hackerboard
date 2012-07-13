require 'spec_helper'

describe QuestionFilter do
	context "when filtering by unanswered" do
		let(:user) { users(:john) }
		let(:question) { questions(:about_rails) }
		let(:category) { categories(:ruby) }

		let!(:another_question) { 
			FactoryGirl.create(:question, :user => user, :category => category) 
		}

		let!(:reply) { 
			question.replies.create!(:body => "My reply", :user_id => user.id) 
		}

		subject { QuestionFilter.find(QuestionFilter::UNANSWERED).all }

		it { should have(1).item }
	end
end