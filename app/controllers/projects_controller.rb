class ProjectsController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  def index
    @projects = Project.all  
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
  end

private

def project_params
  params.require(:project).permit(:title, :description, :goal)
end
end
