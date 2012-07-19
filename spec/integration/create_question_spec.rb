# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Create question" do
  context "when logged" do
    let!(:user) { users(:john) }
    let!(:category) { categories(:ruby) }

    context "with valid data" do
      before do
        login :with => user.email

        visit "/"
        click_link "Adicionar pergunta"

        fill_in "Pergunta", :with => "Some question"
        fill_in "Detalhes", :with => "Some details"
        select category.name, :from => "Categoria"
        click_button "Adicionar pergunta"
      end

      it "redirects to the question" do
        current_path.should match(%r[/questions/\d+])
      end

      it "displays question" do
        page.should have_content("Some question")
      end

      it "displays success message" do
        page.should have_content("Sua pergunta foi adiciona com sucesso!")
      end
    end

    context "with invalid data" do
      before do
        login :with => user.email

        visit "/"
        click_link "Adicionar pergunta"
        click_button "Adicionar pergunta"
      end

      it "renders form page" do
        current_path.should eql(new_question_path)
      end

      it "displays error message" do
        page.should have_content("Verifique o formulário antes de continuar.")
      end
    end
  end

  context "when unlogged" do
    before do
      visit "/"
      click_link "Adicionar pergunta"
    end

    it "redirects to the login page" do
      current_path.should eql(login_path)
    end

    it "displays error message" do
      page.should have_content("Você precisar fazer o login para acessar esta página.")
    end
  end
end
