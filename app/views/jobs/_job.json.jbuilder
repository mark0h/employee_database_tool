json.extract! job, :id, :company, :position, :skill_list, :job_type, :salary_or_hourly, :pay_rate, :created_at, :updated_at
json.url job_url(job, format: :json)