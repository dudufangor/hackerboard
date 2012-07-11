require 'spec_helper'

describe RepliesController do
	describe	"POST :create" do
		context "when unlogged" do
			it "redirects to the login page" do
				post :create, :question_id => 1

			end
		end
	end
end