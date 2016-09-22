class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :position
      t.text :skill_list
      t.string :job_type
      t.string :salary_or_hourly
      t.decimal :pay_rate, :precision => 10, :scale => 2

      t.timestamps null: false
    end
  end
end
