class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, through: :user_jobs
  has_many :job_skills
  has_many :skills, through: :job_skills


  validates :company, presence: true
  validates :position, :uniqueness => {:scope => :company}
  validates :skill_list, presence: true
  validates :job_type, presence: true
  validates :salary_or_hourly, presence: true
  validates :pay_rate, presence: true

end
