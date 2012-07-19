# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Signup" do
  context "with valid data" do
    before do
      visit "/"
      click_link "Cadastre-se"

      fill_in "Nome completo", :with => "John Doe"
      fill_in "E-mail", :with => "john@example.org"
      fill_in "Senha", :with => "test"
      fill_in "Confirmação de senha", :with => "test"

      click_button "Quero me cadastrar"
    end

    it "redirects to the login page" do
      current_path.should eql(login_path)
    end

    it "displays success message" do
      page.should have_content("Seu cadastro foi realizado com sucesso!")
    end

    it "logins with created account" do
      login :with => "john@example.org"

      current_path.should eql(root_path)
      page.should have_content("Olá, John Doe!")
    end
  end

  context "with invalid data" do
    before do
      visit "/"
      click_link "Cadastre-se"
      click_button "Quero me cadastrar"
    end

    it "renders form page" do
      current_path.should eql(signup_path)
    end

    it "displays error messages" do
      page.should have_content("Verifique o formulário antes de continuar.")
    end
  end
end
