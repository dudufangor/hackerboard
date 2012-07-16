require "spec_helper"

describe QuestionsController do
	describe ":GET search" do
		it "delegates to QuestionSearch adapter" do
			QuestionSearch.should_receive(:search).with(hash_including(:page => "10", :query => "my search"))
			get :search, :page => 10, :query => "my search"
		end
	end
end