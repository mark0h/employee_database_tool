class JobSkill < ActiveRecord::Base
  belongs_to :job
  belongs_to :Skill
end
