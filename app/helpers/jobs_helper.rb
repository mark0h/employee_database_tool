module JobsHelper

  def get_skill_list(skill_ids)
    logger.info "get_skill_list: skill_ids: #{skill_ids}"
    @skill_names_list = []
    skill_id_array = skill_ids.gsub(/\[\"\", /,'').gsub(/\"/,'').gsub(/\]/,'').split(', ')
    logger.info "get_skill_list: skill_id_array: #{skill_id_array}"
    skill_id_array.each do |skill_id|
      @skill_names_list << Skill.find(skill_id.to_i).name
    end
    @skill_names_list = @skill_names_list.join(', ')
  end

  def get_potential_hire_count(job_id)
    skill_ids = JobSkill.where(job_id: job_id)
    user_list = UserSkill.where(skill_id: skill_ids)
    @potential_hire_count = user_list.length
  end

  def get_potential_hires(job_id)
    skill_ids = JobSkill.select("skill_id").where(job_id: job_id)
    logger.info "get_potential_hires: skill_ids: #{skill_ids.inspect}"
    @potential_hires = [1]
    user_list = UserSkill.where(skill_id: skill_ids).group_by &:user_id
    logger.info "USER LIST: #{user_list.inspect}"

    user_list.each do |user_id, skills|

      logger.info "user_list each: user_id: #{user_id} skills: #{skills.inspect}"
    end
  end

end
