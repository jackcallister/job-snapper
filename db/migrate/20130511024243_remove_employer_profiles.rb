class RemoveEmployerProfiles < ActiveRecord::Migration
  def up
    drop_table :employer_profiles
  end

  def down
    create_table(:employer_profiles) do |t|
      t.belongs_to :employer
      t.string :company
      t.string :first_name
      t.string :last_name
      t.string :company_description
      t.string :phone
      t.string :mobile
    end
  end
end
