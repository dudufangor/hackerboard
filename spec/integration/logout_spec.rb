# -*- encoding: utf-8 -*-
require "spec_helper"

describe "Logout" do
  context "when logged in" do
    let!(:user) { users(:john) }

    before do
      login :with => user.email
      visit "/"
      click_link "Sair"
    end

    it "redirects to the home page" do
      current_path.should eql(root_path)
    end

    it "omits user name" do
      page.should_not have_content("Olá, #{user.name}!")
    end
  end

  context "when unlogged" do
    before do
      visit logout_path
    end

    it "redirects to the home page" do
      current_path.should eql(root_path)
    end
  end
end
