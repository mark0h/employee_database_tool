class JobsController < ApplicationController

  include JobMethods


  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @filled_employer_jobs = []
    @open_employer_jobs = []
    @employee_jobs = Hash.new
    @user_group_id = User.find(current_user.id).group_id

    Job.where(employer_id: current_user.id).each do |employer_job|
      applied_job = AppliedJob.where(job_id: employer_job.id, status: "Applied").first
      employed_job = AppliedJob.where(job_id: employer_job.id, status: ["Employed", "Complete"]).first
      status, employee = ""
      status = employed_job.status unless employed_job.blank?
      employee = User.find(employed_job.user_id).full_name unless employed_job.blank?

      hash = {
        id: employer_job.id,
        company: employer_job.company,
        position: employer_job.position,
        skill_list: employer_job.skill_list,
        job_type: employer_job.job_type,
        salary_or_hourly: employer_job.salary_or_hourly,
        pay_rate: employer_job.pay_rate,
        status: status,
        employee: employee
      }

      if employed_job
        @filled_employer_jobs << hash
      else
        @open_employer_jobs << hash
      end

    end


    #Get job listing for prospective employees
    user_skills = UserSkill.select("skill_id").where(user_id: current_user.id)
    job_list = JobSkill.select("job_id").where(skill_id: user_skills)
    @employee_jobs = Job.where(id: job_list)
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @skills_listed = []
    JobSkill.where(job_id: @job.id).each do |job_skill|
      skill_list = Skill.find(job_skill.skill_id)
      @skills_listed << "#{skill_list.name}"
    end

     @employee_applied = AppliedJob.where(user_id: current_user.id, job_id: @job.id).first
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @skills_listed = []
    @job = Job.new(job_params)
    @job.employer_id = current_user.id
    respond_to do |format|
      if @job.save
        job_params[:skill_list].each do |skill_id|
          unless skill_id == ''
            JobSkill.create(job_id: @job.id, skill_id: skill_id)
            skill_name = Skill.select("name").find(skill_id)
            @skills_listed << skill_name
          end
        end
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:company, :position, {:skill_list => []}, :job_type, :salary_or_hourly, :pay_rate)
    end
end
