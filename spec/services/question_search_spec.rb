require "spec_helper"

describe QuestionSearch do
  it "delegates to Question.search" do
    args = [
      "my query",
      {:page => 2, :per_page => QuestionSearch.page_size}
    ]

    Question.should_receive(:search).with(*args)

    QuestionSearch.search(:query => "my query", :page => 2)
  end

  it "sets page size" do
    QuestionSearch.page_size.should eql(Paginate::Config.size + 1)
  end
end
