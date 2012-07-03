# -*- encoding: utf-8 -*-
require "spec_helper"
describe "Login" do
	context "with valid account credentials" do
		let!(:user) { users(:john) }

	  before do
	  	visit "/"
			click_link "Entrar"

			fill_in "E-mail", :with => user.email
			fill_in "Senha", :with => "test"
			click_button "Entrar"
	  end

		it "redirects to home page" do
			current_path.should eql(root_path)
		end

		it "displays success message" do

		end

		it "displays user name" do
			page.should have_content("Olá, John Doe")
		end
	end

	context "with invalid account credentials" do

	end
end