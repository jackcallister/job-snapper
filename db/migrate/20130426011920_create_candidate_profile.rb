class CreateCandidateProfile < ActiveRecord::Migration
  def change
    create_table(:candidate_profiles) do |t|
      t.string :introduction
      t.belongs_to :candidate
    end
  end
end
