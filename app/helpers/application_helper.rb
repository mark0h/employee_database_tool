module ApplicationHelper

  def get_employee_skills
    skill_ids = UserSkill.select("skill_id").where(user_id: current_user.id)
    logger.info "skill_ids: #{skill_ids}"
    @employee_skills = Skill.where(id: skill_ids)
    logger.info "@employee_skills: #{@employee_skills.inspect}"
  end

  def get_employee_jobs
    @employee_jobs = []
    AppliedJob.where(user_id: current_user.id).each do |job_status|
      job_info = Job.find(job_status.job_id)
      salary_per = "/ Hour"
      salary_per = "/ Month" if job_info.salary_or_hourly == 'salary'
      job_salary = "#{job_info.pay_rate}#{salary_per}"

      hash = {
        company: job_info.company,
        position: job_info.position,
        job_type: job_info.job_type,
        salary: job_salary,
        status: job_status.status
      }

      @employee_jobs << hash
    end


  end

  def get_all_skills
    user_skills = UserSkill.select("skill_id").where(user_id: current_user.id)
    @all_skills = Skill.where.not(id: user_skills)
  end

end
