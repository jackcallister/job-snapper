class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :job_id, :null => false
      t.integer :category_id, :null => false

      t.timestamps
    end
  end
end
