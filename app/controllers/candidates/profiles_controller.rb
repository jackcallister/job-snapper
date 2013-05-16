class Candidates::ProfilesController < ApplicationController
  before_filter :authenticate_candidate!

  def new
    if current_candidate.has_profile?
      redirect_to edit_candidates_profiles_path
    else
      @profile = Candidate::Profile.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @profile }
      end
    end
  end

  def create
    @profile = current_candidate.build_profile(candidate_profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to edit_candidates_profiles_path, notice: "Profile successfully created." }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render new_candidates_profiles_path }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if !current_candidate.has_profile?
      redirect_to new_candidates_profiles_path
    else
      @profile = Candidate::Profile.find_by(:candidate_id => current_candidate.id)
    end
  end

  def update
    @profile = Candidate::Profile.find_by_candidate_id(current_candidate)

    respond_to do |format|
      if @profile.update_attributes(candidate_profile_params)
        format.html { redirect_to edit_candidates_profiles_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def candidate_profile_params
    params.require(:candidate_profile).permit(
      :name,
      :age,
      :address,
      :contact_number,
      :region,
      :city_or_town,
      :about_me,
      :previous_work_experience,
      :skill_list,
      :region_id,
      :city_id
      )
  end
end
