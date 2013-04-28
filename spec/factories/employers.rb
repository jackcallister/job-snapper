# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employer do
    sequence(:email) { |n| "employer_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
