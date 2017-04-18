class JobsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destory]
def index
   @jobs = Job.where(:is_hidden => false).order("created_at DESC")
end

def show
  @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
end
def new
  @job = Job.new
end

def create
  @job = Job.new(job_params)
  if @job.save
    redirect_to jobs_path
  else
    render :new
  end
end
def edit
  @job = Job.find(params[:id])
end
def update
  @job = Job.find(params[:id])
if @job.update(job_params)
  redirect_to jobs_path, notice: "更新成功！ Update Success！"
else
  render :edit
end
end
def destroy
@job = Job.find(params[:id])
@job.destroy
flash[:alert] = "职位已删除！ Job deleted！"
redirect_to jobs_path
end

  private
  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)

end
end
