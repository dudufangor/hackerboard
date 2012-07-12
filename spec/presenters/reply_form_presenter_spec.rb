require 'spec_helper'
describe ReplyFormPresenter do
	let(:user) { mock("user") }
	let(:question) { mock("question") }
	let(:reply) {mock("reply")}

context "when user is present" do
	subject {
		ReplyFormPresenter.new(user, question, reply)
	}

	its(:partial) { 
		should eql(["reply/form", :question => question, :reply => reply]) 
	}
end

context "when user is missing" do
	subject {
		ReplyFormPresenter.new(nil, question, reply)
	}

	its(:partial) {
		should eql("reply/require_login")
	}
end

end