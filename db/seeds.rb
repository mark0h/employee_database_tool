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

#USer create
User.create(first_name: 'The', last_name: 'Admin', email: 'admin@mail.com', group_id: 1, password: 'password')
User.create(first_name: 'Mr', last_name: 'Employer', email: 'employer1@mail.com', group_id: 2, password: 'password')
User.create(first_name: 'Mrs', last_name: 'Employer', email: 'employer2@mail.com', group_id: 2, password: 'password')
User.create(first_name: 'Mrs', last_name: 'Employee', email: 'employee1@mail.com', group_id: 3, password: 'password')
User.create(first_name: 'Mr', last_name: 'Employee', email: 'employee2@mail.com', group_id: 3, password: 'password')

#Create some jobs
job = Job.create(company: "Bob's Painting Service", position: 'Painter', skill_list: "[\"\", \"1\", \"2\"]", job_type: "Contract", salary_or_hourly: "hourly", pay_rate: 15.00, employer_id: 3)
JobSkill.create(job_id: job.id, skill_id: 1)
JobSkill.create(job_id: job.id, skill_id: 2)
job = Job.create(company: "Bob's Painting Service", position: "Painter II", skill_list: "[\"\", \"2\"]", job_type: "Full time", salary_or_hourly: "salary", pay_rate: 4000.00, employer_id: 3)
JobSkill.create(job_id: job.id, skill_id: 2)
job = Job.create(company: "GGB", position: "Electrician", skill_list: "[\"\", \"3\", \"4\"]", job_type: "Full time", salary_or_hourly: "hourly", pay_rate: 23.00, employer_id: 2)
JobSkill.create(job_id: job.id, skill_id: 3)
JobSkill.create(job_id: job.id, skill_id: 4)
job = Job.create(company: "Muppet Delivery", position: "Driver", skill_list: "[\"\", \"5\"]", job_type: "Holiday", salary_or_hourly: "hourly", pay_rate: 11.00, employer_id: 2)
JobSkill.create(job_id: job.id, skill_id: 5)
job = Job.create(company: "Green Acres", position: "Brush Removal", skill_list: "[\"\", \"10\"]", job_type: "Part time", salary_or_hourly: "hourly", pay_rate: 9.00, employer_id: 3)
JobSkill.create(job_id: job.id, skill_id: 10)
job = Job.create(company: "Shield Protection", position: "Security", skill_list: "[\"\", \"6\"]", job_type: "Holiday", salary_or_hourly: "hourly", pay_rate: 17.00, employer_id: 2)
JobSkill.create(job_id: job.id, skill_id: 6)
job = Job.create(company: "Without a Paddle", position: "Plumber", skill_list: "[\"\", \"9\"]", job_type: "Full time", salary_or_hourly: "hourly", pay_rate: 21.00, employer_id: 2)
JobSkill.create(job_id: job.id, skill_id: 9)
job = Job.create(company: "Cool Plumbings", position: "Repairman", skill_list: "[\"\", \"7\"]", job_type: "Part time", salary_or_hourly: "hourly", pay_rate: 28.00, employer_id: 2)
JobSkill.create(job_id: job.id, skill_id: 7)
job = Job.create(company: "Shield Protection", position: "Contractor", skill_list: "[\"\", \"8\"]", job_type: "Contract", salary_or_hourly: "salary", pay_rate: 5500.00, employer_id: 3)
JobSkill.create(job_id: job.id, skill_id: 8)
