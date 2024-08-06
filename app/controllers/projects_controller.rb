class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  def index
    @projects = Project.all
  end

  def show
  end

  def gallery
    @project = Project.find_by(params[:id])
  end

  def new
    @project = Project.new
    @project.images.build
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Projeto criado com sucesso.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, images_attributes: [:id, :url, :_destroy])
  end
end
