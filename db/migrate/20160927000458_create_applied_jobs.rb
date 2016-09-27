class CreateAppliedJobs < ActiveRecord::Migration
  def change
    create_table :applied_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :status
      t.text :submission_text

      t.timestamps null: false
    end
  end
end
