require "spec_helper"

feature "Candidate profile updating" do

  before(:each) do
    @candidate = FactoryGirl.create(:candidate)
    @candidate.build_profile.save
    sign_in_candidate @candidate
    visit edit_candidates_profile_path
 end

  scenario "first name" do
    fill_in "First name", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).first_name.should eq("Test")
  end

  scenario "last name" do
    fill_in "Last name", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).last_name.should eq("Test")
  end

  scenario "age" do
    fill_in "Age", with: "25"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).age.should eq(25)
  end

  scenario "address line 1" do
    fill_in "Address line 1", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).address_line_1.should eq("Test")
  end

  scenario "address line 2" do
    fill_in "Address line 2", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).address_line_2.should eq("Test")
  end

  scenario "region" do
    fill_in "Region", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).region.should eq("Test")
  end

  scenario "city/town" do
    fill_in "City/town", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).city_or_town.should eq("Test")
  end

  scenario "about me" do
    fill_in "About me", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).information.should eq("Test")
  end

  scenario "previous work experience" do
    fill_in "Previous work experience", with: "Test"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).previous_work_experience.should eq("Test")
  end

  scenario "skills" do
    fill_in "Skills", with: "b, a"
    click_button "Update profile"
    Candidate::Profile.find_by_candidate_id(@candidate).skill_list.first.should eq("a")
    Candidate::Profile.find_by_candidate_id(@candidate).skill_list.last.should eq("b")
  end
end