module JobMethods
  extend ActiveSupport::Concern

  def employee_apply_to_job
    AppliedJob.where(user_id: current_user.id, job_id: params[:job_id], status: "Applied", submission_text: params[:submission_text]).first_or_create

    #This is just so we don't need an add_skill template!
    respond_to do |format|
      format.js { render nothing: true }
    end

  end

  def assign_jobs
    @ready_to_assign_jobs = []
    @assigned_jobs = []
    AppliedJob.all.each do |applied_job_info|
      employee_info = User.find(applied_job_info.user_id)
      employee_name = employee_info.full_name
      company_info = Job.find(applied_job_info.job_id)
      company_name = company_info.company
      position_name = company_info.position
      salary_or_hourly = company_info.salary_or_hourly
      pay_rate = company_info.pay_rate
      status = applied_job_info.status

      job_id_user_id = "#{company_info.id}_#{employee_info.id}"

      user_skills = UserSkill.where(user_id: employee_info.id).pluck(:skill_id)
      job_skills = JobSkill.where(job_id: company_info.id).pluck(:skill_id)

      matched_skills = user_skills & job_skills

      logger.info "LOOK AT THIS!!! applied_job_info.id: #{applied_job_info.id} assign_jobs: matched_skills: #{matched_skills.inspect} user_skills: #{user_skills.inspect} job_skills: #{job_skills.inspect}"

      hash = {
        company: company_name,
        position: position_name,
        employee_name: employee_name,
        salary_or_hourly: salary_or_hourly,
        pay_rate: pay_rate,
        matched_skills: matched_skills,
        status: status,
        job_id_user_id: job_id_user_id
      }

      #Determine which array of hashes the hash values go into, based on status value
      if status == "Applied"
        logger.info "ADDING TO ready_to_assign_jobs matched_skills: #{matched_skills}"
        @ready_to_assign_jobs << hash
      else
        logger.info "ADDING TO ASSIGNED_JOBS matched_skills: #{matched_skills}"
        @assigned_jobs << hash
      end

    end
    
  end

  def assign_employee
    job_id_user_id = params[:job_id_user_id].split('_')
    job_id = job_id_user_id[0]
    user_id = job_id_user_id[1]

    logger.info "job_id_user_id: #{job_id_user_id} job_id: #{job_id} user_id: #{user_id}"

    user_applied = AppliedJob.where(user_id: user_id, job_id: job_id, status: "Applied").first
    user_applied.update(status: "Employed")
  end


end
