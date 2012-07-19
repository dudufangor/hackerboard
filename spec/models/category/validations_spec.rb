require "spec_helper"

describe Category, "validations" do
  it { should allow("Ruby on Rails").for(:name) }
  it { should_not allow(nil).for(:name) }
end
