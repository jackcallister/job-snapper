require "spec_helper"

describe Applicants::ApplicationController do

  let(:job) { FactoryGirl.create(:job) }
  let(:candidate) { FactoryGirl.create(:candidate) }

  before do
    candidate.build_profile.save
    sign_in :candidate, candidate
  end

  describe "GET new" do

    before do
      job
      get :new
    end

    it "should create an applications" do
      post :create, job_id: job.id, candidate: candidate.id
      expect Application.all.count(1)
    end

    it "should only allow unique applications" do
      post :create, job_id: job.id, candidate: candidate.id
      post :create, job_id: job.id, candidate: candidate.id
      expect Application.all.count(1)
    end
  end
end
