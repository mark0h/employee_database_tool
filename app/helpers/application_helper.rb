module ApplicationHelper

  def get_employee_skills
    skill_ids = UserSkill.select("skill_id").where(user_id: current_user.id)
    logger.info "skill_ids: #{skill_ids}"
    @employee_skills = Skill.where(id: skill_ids)
    logger.info "@employee_skills: #{@employee_skills.inspect}"
  end

  def get_employee_jobs
    job_ids = UserJob.select("job_id").where(user_id: current_user.id)
    @employee_jobs = Job.where(id: job_ids)
  end

end
