# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :candidate do
    sequence(:name) { |n| "candidate_#{n}" }
    sequence(:email) { |n| "_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
