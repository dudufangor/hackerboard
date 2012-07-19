require "spec_helper"

describe Question, "assignment" do
  it "doesn't throw exception" do
    expect {
      Question.new({
        :title => "Some title",
        :body => "Some body",
        :category_id => 1
      })
    }.to_not raise_error
  end
end
