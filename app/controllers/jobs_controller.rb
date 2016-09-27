class JobsController < ApplicationController

  include JobMethods


  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @employer_jobs = Hash.new
    @employee_jobs = Hash.new
    @user_group_id = User.find(current_user.id).group_id
    @employer_jobs = Job.where(employer_id: current_user.id)

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
