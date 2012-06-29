require "spec_helper"

describe User, "validations" do
	it { should allow("John").for(:name) }
	it { should_not allow(nil).for(:name) }

	it { should allow("test").for(:password) }
	it { should_not allow(nil).for(:password) }

	it { should allow("john@example.com").for(:email) }
	it { should_not allow("invalid").for(:email) }

	context "email uniqueness" do
	  let! (:user) {
	  User.create!({
	  :name => "John Doe",
		:email => "john@example.com",
		:password => "test",
		:password_confirmation => "test"
	  })
	  }

		it { should_not allow(user.email) }
	end
end
