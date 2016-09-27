module JobMethods
  extend ActiveSupport::Concern

  def employee_apply_to_job
    AppliedJob.where(user_id: current_user.id, job_id: params[:job_id], status: "Applied", submission_text: params[:submission_text]).first_or_create

    #This is just so we don't need an add_skill template!
    respond_to do |format|
      format.js { render nothing: true }
    end
    
  end


end
