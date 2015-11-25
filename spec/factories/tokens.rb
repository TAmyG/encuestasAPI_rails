FactoryGirl.define do
  factory :token do
    expires_at "2015-12-15 15:34:21"
    association :user, factory: :user
  end
end
