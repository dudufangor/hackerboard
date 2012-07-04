require "spec_helper"

describe "Create questions" do
	context "when logged" do
		let!(:user) { users(:john) }
		let!(:category) { FactoryGirl.create(:category) }

	  context "with valid data" do
	  	before do
	  		login :with => user.email

	  		visit "/"
	  		click_link "Adicionar pergunta"

	  		fill_in "Pergunta", :with => "Some question"
	  		fill_in	"Detalhes", :with => "Some details"
	  		select category.name, :from => "Categoria"
	  		click_button "Adicionar pergunta"
	  	end

	  	it "redirects to the question" do
	  		current_path.should match(%r[/questions/\d+])
	  	end

	  	it "displays succes message" do
				page.should have_content("Sua pergunta foi adicionada com sucesso!")
	  	end
	  end

	  context "with invalid data" do
	  end

		context "when unlogged" do

		end

	end
end
