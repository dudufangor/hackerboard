require "spec_helper"

describe Reply, "assignment" do
  it "doesn't throw exception" do
    expect {
      Reply.new({
        :body => "Some body",
        :question_id => 1,
        :user_id => 1
      })
    }.to_not raise_error
  end
end
