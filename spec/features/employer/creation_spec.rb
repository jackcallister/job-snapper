require "spec_helper"

feature "Employer creation" do

  before { visit new_employer_registration_path }

  scenario "with valid information" do
    sign_up_with "test@example.com", "password"

    expect(page).to have_content I18n.t("devise.registrations.signed_up")
  end

  scenario "with an invalid email" do
    sign_up_with "testexample.com", "password"

    expect(page).to have_content ("Email is invalid")
  end

  scenario "with a short password" do
    sign_up_with "test@example.com", "test"

    expect(page).to have_content("Password is too short")
  end
end
