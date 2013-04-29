require "spec_helper"
include Warden::Test::Helpers
Warden.test_mode!

feature "Candidate updating account" do

  before(:each) do
    @candidate = FactoryGirl.create(:candidate)
    login_as(@candidate, :scope => :candidate)
    visit edit_candidate_registration_path
  end

  scenario "email" do
    fill_in "Email", :with => "new_email@example.com"
    fill_in "Current password", :with => @candidate.password
    click_button "Update"

    Candidate.last.email.should eq("new_email@example.com")
  end

  scenario "password" do
    find('.js-password').set "new_password"
    find('.js-password-confirmation').set "new_password"
    fill_in "Current password", :with => @candidate.password
    click_button "Update"

    expect(page).to have_content I18n.t("devise.registrations.updated")
  end
end
