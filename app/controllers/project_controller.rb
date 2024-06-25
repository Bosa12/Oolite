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
      if params[:images]
        params[:images].each do |image|
          @project.images.create(image: image)
        end
      end
      redirect_to @project, notice: 'Projeto criado com sucesso.'
    else
      render :new
    end
  end
  private

  def project_params
    params.require(:project).permit(:name, images_attributes: [:id, :url, :_destroy])
  end
end
