require "spec_helper"

describe User, "validations" do
  it { should allow("John").for(:name) }
  it { should_not allow(nil).for(:name) }

  it { should allow("john@example.org").for(:email) }
  it { should_not allow("invalid", nil).for(:email) }

  it { should allow("test").for(:password) }
  it { should_not allow(nil).for(:password) }

  context "e-mail uniqueness" do
    let!(:user) { users(:john) }
    it { should_not allow(user.email).for(:email) }
  end

  context "password validation" do
    let!(:user) { users(:john) }

    it "doesn't require password when not setting password" do
      user.update_attributes :email => "updated@example.org"
      user.should be_valid
    end

    it "requires password when setting password" do
      user.update_attributes :password => "test", :password_confirmation => nil
      user.errors[:password_confirmation].should_not be_empty
    end
  end
end
