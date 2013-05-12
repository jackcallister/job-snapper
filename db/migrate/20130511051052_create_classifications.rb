class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :job_id, :null => false
      t.integer :type_id, :null => false
    end
  end
end
