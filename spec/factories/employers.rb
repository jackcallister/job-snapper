# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employer do
    sequence(:email) { |n| "employer_#{Devise.friendly_token[0..6]}@example.com" }
    password "password"
    password_confirmation "password"
  end
end
