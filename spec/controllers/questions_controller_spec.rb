require "spec_helper"

describe QuestionsController do
  describe "GET :search" do
    let(:questions) { mock("questions").as_null_object }

    before do
      QuestionSearch.stub :search => questions
    end

    it "assigns questions" do
      get :search, :query => "my search"
      assigns[:questions].should eql(questions)
    end

    it "delegates to QuestionSearch adapter" do
      QuestionSearch.should_receive(:search).with(hash_including(:page => "10", :query => "my search"))
      get :search, :page => 10, :query => "my search"
    end
  end
end
