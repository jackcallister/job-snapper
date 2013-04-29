class AddFieldsToEmployerProfiles < ActiveRecord::Migration
  def change
    add_column :employer_profiles, :first_name, :string
    add_column :employer_profiles, :last_name, :string
    add_column :employer_profiles, :company_description, :string
    add_column :employer_profiles, :phone, :string
    add_column :employer_profiles, :mobile, :string
  end
end
