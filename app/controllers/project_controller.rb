class ProjectController < ApplicationController

  def index
     @projects = Project.all
  end

  def show
     @project = Project.find(params[:id])
  end
  def new
    @project = Project.new
    @project.images.build
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end
  private

  def project_params
    params.require(:project).permit(:name, :description, :project_type_id, images_attributes: [:file])
  end
end
