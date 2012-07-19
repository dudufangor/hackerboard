require "spec_helper"

describe Question, "validations" do
  it { should_not allow(nil).for(:title) }
  it { should_not allow(nil).for(:body) }
  it { should_not allow(nil).for(:category) }
  it { should_not allow(nil).for(:user) }
end
