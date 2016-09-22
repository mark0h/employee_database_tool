class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :job_skills
  has_many :jobs, through: :job_skills


  validates :name, presence: true
  validates :level, :uniqueness => {:scope => :name}

  def name_with_level
    "#{name} level #{level}"
  end
end
