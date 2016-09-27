module JobsHelper

  def get_skill_list(skill_ids)
    logger.info "assign_jobs: matched_skills:  get_skill_list skill_ids: #{skill_ids.inspect}"
    @skill_names_list = []
    #We need to gsub, but ONLY if it is coming right from the table, since the value is ["", "2", "3"] etc...
    skill_ids = skill_ids.gsub(/\[\"\", /,'').gsub(/\"/,'').gsub(/\]/,'').split(', ') unless skill_ids.kind_of?(Array)
    skill_ids.each do |skill_id|
      @skill_names_list << Skill.find(skill_id.to_i).name
    end
    @skill_names_list = @skill_names_list.join(', ')
  end

  def get_potential_hire_count(job_id)
    skill_ids = JobSkill.where(job_id: job_id)
    user_list = UserSkill.where(skill_id: skill_ids).index_by &:user_id
    @potential_hire_count = user_list.length
  end

  def get_potential_hires(job_id)
    skill_ids = JobSkill.select("skill_id").where(job_id: job_id)
    @potential_hires = []
    user_list = UserSkill.where(skill_id: skill_ids).group_by &:user_id

    user_list.each do |user_id, user_info|
      employee_skills = []
      employee_name = User.find(user_id).full_name
      user_info.each do |userskill|
        skill_name = Skill.find(userskill.skill_id).name
        employee_skills << skill_name
      end

      hash = {
        employee_name: employee_name,
        skills: employee_skills.join(', '),
        job_id_user_id: "#{job_id}_#{user_id}"
      }
      @potential_hires << hash

      logger.info "user_list each: user_id: #{user_id} user_info: #{user_info.inspect}"
    end

    @potential_hire_count = @potential_hires.length
  end

end
