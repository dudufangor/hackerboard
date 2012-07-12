require "spec_helper"

describe "Add reply" do
	let(:question) { questions(:about_rails)}
	let(:user) {users(:john)}
	context "when logged in" do
		end
		context "with valid data" do
			before do
				login :with => user.email
				visit question_path(question)

				fill_in "Resposta", :with => "Some reply"
				click_button "Enviar resposta"
			end

			it "redirects to question page" do
				current_path.should eql(question_path(question))
			end

			it "displays succes messasge" do
				page.should have_content("Sua resposta foi adicionada!")
			end

			it "should displays replie" do
				page.should have_content("Some reply")
			end
		

		context "with invalid data" do
		end


	context "when unlogged" do
	end
	end
end
