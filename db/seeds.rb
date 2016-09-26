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
Skill.create(name: 'Painter')
Skill.create(name: 'Advanced Painter')
Skill.create(name: 'Electrician')
Skill.create(name: 'Master Electrician')
Skill.create(name: 'Truck Driver')
Skill.create(name: 'Security')
Skill.create(name: 'HVAC Repair')
Skill.create(name: 'Contractor')
Skill.create(name: 'Plumber')
Skill.create(name: 'General Labor')
