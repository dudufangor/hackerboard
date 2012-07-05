require "spec_helper"

describe Reply, "validations" do
	it { should_not allow(nil).for.(:body) }
	it { should_not allow(nil).for.(:question) }
	it { should_not allow(nil).for.(:user) }
end
