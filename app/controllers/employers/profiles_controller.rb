class Employers::ProfilesController < ApplicationController
  before_filter :authenticate_employer!
  # Dear future jack. Please complete the required CRUD to complete the Employer profile. Then
  # Get on to writing tests to make sure there are no holes etc. While we are at it why don't wee tdd
  # a job model (also make a category model & pay scale model & any others you can think of).

  def create
    @profile = current_employer.build_profile(employer_profile_params)

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
    @profile = Employer::Profile.find_by_employer_id(current_employer)
  end

  def show
    @profile = Employer::Profile.find_by_employer_id(current_employer)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  def update
    @profile = Employer::Profile.find_by_employer_id(current_employer)

    respond_to do |format|
      if @profile.update_attributes(employer_profile_params)
        format.html { redirect_to root_url, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile = Employer::Profile.find_by_employer_id(current_employer)
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def employer_profile_params
    params.require(:employer_profile).permit(
      :first_name,
      :last_name,
      :company,
      :company_description,
      :phone,
      :mobile
      )
  end
end
