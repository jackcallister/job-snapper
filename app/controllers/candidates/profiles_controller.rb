class Candidates::ProfilesController < ApplicationController
  before_filter :authenticate_candidate!

  def create
    @profile = current_candidate.build_profile(candidate_profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to root_url, notice: "Profile successfully created." }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render @profile }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @profile = Candidate::Profile.find_by_candidate_id(current_candidate)
  end

  def show
    @profile = Candidate::Profile.find_by_candidate_id(current_candidate)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  def update
    @profile = Candidate::Profile.find_by_candidate_id(current_candidate)

    respond_to do |format|
      if @profile.update_attributes(candidate_profile_params)
        format.html { redirect_to root_url, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Candidate::Profile.find_by_candidate_id(current_candidate)
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def candidate_profile_params
    params.require(:candidate_profile).permit(
      :first_name,
      :last_name,
      :age,
      :address_line_1,
      :address_line_2,
      :region,
      :city_or_town,
      :information,
      :previous_work_experience,
      :skill_list
      )
  end
end
