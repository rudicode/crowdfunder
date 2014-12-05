class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  def index
    @projects = Project.all  
  end

  def show
    @project = Project.find(params[:id])
    @rewards = @project.rewards
    @total_pledges = Project.find(params[:id]).pledges.sum(:amount)
 
    @pledge_percent =  (@total_pledges.to_f / @project.goal.to_f * 100) 

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    
    if @project.save

      redirect_to project_path(@project), notice: 'Project Created Successfully'
    else
      flash.now[:alert] = 'Could not create Project'
      render :new
    end

  end

  def update
    
  end

private

def project_params
  params.require(:project).permit(:start_date,:picture, :finish_date, :title, :description, :goal,
                                  rewards_attributes: [:min_amount, :description])
end
end
