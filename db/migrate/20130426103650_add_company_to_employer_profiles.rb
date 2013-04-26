class AddCompanyToEmployerProfiles < ActiveRecord::Migration
  def change
    add_column :employer_profiles, :company, :string
  end
end
