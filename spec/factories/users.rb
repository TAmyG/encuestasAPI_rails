FactoryGirl.define do
  factory :user do
    email "tamy.vivas@gmail.com"
    name "TAmy"
    provider "github"
    uid "MyString"
  end
end
