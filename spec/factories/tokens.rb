FactoryGirl.define do
  factory :token do
    expires_at "2015-11-19 15:34:21"
    association :user, factory: :user
  end
end
