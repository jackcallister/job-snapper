class CreateJobs < ActiveRecord::Migration
  def change
    create_table(:jobs) do |t|
      t.string    :title, :null => false, :default => ""
      t.string    :company
      t.integer   :type_id, :null => false
      t.integer   :category_id, :null => false
      t.integer   :pay_rate_id, :null => false
      t.datetime  :start_date
      t.datetime  :end_date
      t.integer   :employer_id, :null => false

      t.timestamps
    end
  end
end
