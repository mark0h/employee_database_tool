class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :Skill
end
