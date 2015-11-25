FactoryGirl.define do
  factory :user do
    email "tamy.vivaz@gmail.com"
    name "TAmy"
    provider "github"
    uid "MyString"
    factory :dummy_user do
        email "tamy2@gmail.com"
        name "TAmy2"
        provider "twitter"
        uid "MyString"
    end
    factory :sequence_user do
			sequence(:email) { |n| "person#{n}@example.com" }
			name "TAmyG3"
			provider "facebook"
			uid "duah18y2beda"
    end
  end
end
