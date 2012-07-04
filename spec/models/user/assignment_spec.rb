require "spec_helper"
describe User, "assignment" do

	it "doesn't throw exception" do
		expect {
		User.create!({
			:name => "John Doe",
			:email => "john@example.org",
			:password => "test",
			:password_confirmation => "test"
		})
		}.to_not raise_error
	end
end
