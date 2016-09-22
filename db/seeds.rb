# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.create(name: 'Administrator')
Group.create(name: 'Employer')  #Can add jobs
Group.create(name: 'Employee')


#Create some skills
Skill.create(name: 'Painter', level: 1)
Skill.create(name: 'Painter', level: 2)
Skill.create(name: 'Painter', level: 3)

Skill.create(name: 'Networking', level: 1)
Skill.create(name: 'Networking', level: 2)
Skill.create(name: 'Networking', level: 3)

UserSkill.create(user_id: 1, skill_id: 2)
UserSkill.create(user_id: 1, skill_id: 4)
