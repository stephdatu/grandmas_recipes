FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@recipes.com" }
    password "password"
    password_confirmation "password"
  end
end
