require "spec_helper"
describe User, "assignment" do
#	subject {
#		User.new({
#			:email => "John Doe",
#			:name => "john@example.org",
#			:password => "teste",
#			:password_confirmation => "test"
#		})
#	}

#	its(:name) { should eql("John Doe") }
#	its(:email) { should eql("john@example.org") }
#	its(:password_confirmation) { should eql("test") }
#	its(:password) { should eql("test") }
	xit "doesn't throw exception" do
		expect {
		User.create!({
			:email => "John Doe",
			:name => "john@example.org",
			:password => "test",
			:password_confirmation => "test"
		})
		}.to_not raise_error
	end
end
