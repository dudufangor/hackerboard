# encoding: UTF-8
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

	  	it "displays question" do
	  		page.should have_content("Some question")
	  	end
	  end

	  context "with invalid data" do
	  	before do
	  		login :with => user.email

	  		visit "/"
	  		click_link "Adicionar pergunta"
	  		click_button "Adicionar pergunta"
	  	end

	  	it "render form page" do
	  		current_path.should eql(new_question_path)
	  	end

	  	it "displays error message" do
				page.should have_content("Verifique o formulário antes de continuar.")
	  	end
	  end

		context "when unlogged" do
			before do
			  visit "/"
			  click_link "Adicionar pergunta"
			end

			it "redirects to the login" do
				current_path.should eql(login_path)
			end

			it "displays error message" do
				a = "Você precisa fazer o login para acessar essa pagina."
				page.should have_content(a)
			end

		end

	end
end
