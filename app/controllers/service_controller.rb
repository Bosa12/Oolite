class ServiceController < ApplicationController
  def index
     @projects = Project.all
  end
  def project
     @project = Project.all
  end

  def contact
     @contact = Contact.new
  end
end
