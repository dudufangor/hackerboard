FactoryGirl.define do
	factory :user do
		name "John Doe"
		sequence(:email) {|i| "john#{i}@example.og"}
		password "test"
		password_confirmation "test"
	end

	factory	:category do
		name "Some category"
	end

	factory	:question do
		title "Some question"
		body "Some details"
		association :user
		association :category
	end

	preload do
		factory(:john) do
			FactoryGirl.create(:user)
 		end

		factory(:ruby) do
			FactoryGirl.create(:category)
 		end
	end
end
