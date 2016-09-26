class ProfileController < ApplicationController
  def index
  end

  def add_skill
    logger.info "params[:skill_list]: #{params[:skill_list]} params[:skill_list].class: #{params[:skill_list].class}"
    params[:skill_list].each do |skill_id|
      UserSkill.where(user_id: current_user.id, skill_id: skill_id).first_or_create unless skill_id == ""
    end

    #This is just so we don't need an add_skill template!
    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  def remove_skill
    logger.info "params[:skill_id]: #{params[:skill_id]}"
    skill_remove = UserSkill.where(user_id: current_user.id, skill_id: params[:skill_id])
    skill_remove.destroy_all

    #This is just so we don't need an add_skill template!
    respond_to do |format|
      format.js { render nothing: true }
    end
  end


end
