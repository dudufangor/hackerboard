require "spec_helper"
describe Category, "validations" do
	it {should_not allow(nil).for(:name)}
	it {should allow("Ruby on Rails").for(:name)}
end
