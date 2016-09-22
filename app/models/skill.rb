class Skill < ActiveRecord::Base
  has_many :user_skills
  has_many :users, through: :user_skills
  validates :name, presence: true
  validates :level, :uniqueness => {:scope => :name}
end
