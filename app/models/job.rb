class Job < ActiveRecord::Base
  has_many :user_jobs
  has_many :users, through: :user_jobs
  validates :name, presence: true
  validates :level, :uniqueness => {:scope => :name}
end
