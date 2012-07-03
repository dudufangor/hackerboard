FactoryGirl.define do
	factory :user do
		name "John Doe"
		sequence(:email) {|i| "john#{i}@example.og"}
		password "test"
		password_confirmation "test"
	end

	preload do
		factory(:john) do
			FactoryGirl.create(:user)
 		end
	end
end
