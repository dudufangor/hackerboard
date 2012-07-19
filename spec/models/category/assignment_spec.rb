require "spec_helper"

describe Category, "assignment" do
  it "doesn't throw exception" do
    expect {
      Category.create!({
        :name => "Ruby on Rails"
      })
    }.to_not raise_error
  end
end
