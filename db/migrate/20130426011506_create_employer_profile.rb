class CreateEmployerProfile < ActiveRecord::Migration
  def change
    create_table(:employer_profiles) do |t|
      t.string :company
      t.belongs_to :employer
    end
  end
end
