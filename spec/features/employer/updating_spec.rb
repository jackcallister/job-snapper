require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "Employer updating account" do

  before(:each) do
    @employer = FactoryGirl.create(:employer)
    login_as(@employer, :scope => :employer)
    visit edit_employer_registration_path
  end

  scenario "email" do
    fill_in "Email", :with => "new_email@example.com"
    fill_in "Current password", :with => @employer.password
    click_button "Update"

    Employer.last.email.should eq("new_email@example.com")
  end

  scenario "password" do
    find('.js-password').set "new_password"
    find('.js-password-confirmation').set "new_password"
    fill_in "Current password", :with => @employer.password
    click_button "Update"

    expect(page).to have_content I18n.t("devise.registrations.updated")
  end
end
