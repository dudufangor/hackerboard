require "spec_helper"

describe User, "validations" do
	subject	{User.create.errors}

	its([:name]) { should_not be_empty }
end
