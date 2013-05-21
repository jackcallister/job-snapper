require "spec_helper"

feature "job searching" do
  let(:region) { FactoryGirl.create(:region) }
  let(:city)  { FactoryGirl.create(:city, :region => region) }
  let(:category) { FactoryGirl.create(:category) }
  let(:job_type) { FactoryGirl.create(:type, :title => "Full-time") }

  let(:matching_job) do
    FactoryGirl.create(:job, :region => region, :city => city, :category => category, :type => job_type)
  end

  let(:non_matching_job) do
    FactoryGirl.create(:job, :type => FactoryGirl.create(:type, :title => "Part-time"))
  end

  before do
    region
    city
    category
    matching_job
    non_matching_job
    visit jobs_path
  end

  scenario "filtering by region" do
    within "#job_search" do
      select region.name, from: 'q_region_id_eq'
      click_button 'Search'
    end

    within '.media-job' do
      expect(page).to have_content matching_job.title
      expect(page).to_not have_content non_matching_job.title
    end
  end

  scenario "filtering by job type" do
    within "#job_search" do
      select job_type.title, from: 'q_type_id_eq'
      click_button 'Search'
    end

    within '.media-job' do
      expect(page).to have_content matching_job.title
      expect(page).to_not have_content non_matching_job.title
    end
  end

  scenario "filtering by city" do
    within "#job_search" do
      select city.name, from: 'q_city_id_eq'
      click_button 'Search'
    end

    within '.media-job' do
      expect(page).to have_content matching_job.title
      expect(page).to_not have_content non_matching_job.title
    end
  end

  scenario "filtering by category" do
    within "#job_search" do
      select category.title, from: 'q_category_id_eq'
      click_button 'Search'
    end

    within '.media-job' do
      expect(page).to have_content matching_job.title
      expect(page).to_not have_content non_matching_job.title
    end
  end

  scenario "searching by name" do
    within "#job_search" do
      fill_in 'q_title_or_description_cont', with: matching_job.title[0..-1]
      click_button 'Search'
    end

    within '.media-job' do
      expect(page).to have_content matching_job.title
      expect(page).to_not have_content non_matching_job.title
    end
  end
end
