# -*- encoding: utf-8 -*-
require "spec_helper"

shared_examples_for "welcome email" do
  its(:body) { should have_content("http://example.org/login") }
  its(:body) { should have_content("Olá John Doe") }
end

describe Mailer do
  describe "#welcome" do
    let(:mail) {
      Mailer.welcome({
        :name => "John Doe",
        :email => "john@example.org",
        :url => "http://example.org/login"
      })
    }

    subject { mail }

    its(:subject) { should eql("Bem-vindo ao Hackerboard") }
    its(:from) { should include("noreply@hackerboard.com") }

    it { should be_multipart }

    context "html email" do
      subject { mail.parts.last }
      it_behaves_like "welcome email"
    end

    context "text email" do
      subject { mail.parts.first }
      it_behaves_like "welcome email"
    end
  end
end
